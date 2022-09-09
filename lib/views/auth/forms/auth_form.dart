import 'package:aptitudes/blocs/authentication/bloc/authentication_bloc.dart';
import 'package:aptitudes/blocs/blocs.dart';
import 'package:aptitudes/config/colors.dart';
import 'package:aptitudes/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/models.dart';
import '../components/components.dart';

class AuthForm extends StatefulWidget {
  const AuthForm(
      {Key? key,
      required this.authMode,
      this.cancelCallback,
      this.changeAuthMode})
      : super(key: key);

  final AuthMode authMode;
  final GestureTapCallback? cancelCallback;
  final GestureTapCallback? changeAuthMode;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm>
    with SingleTickerProviderStateMixin {
  late Animation<double?> containerSize;
  late AnimationController animationController;
  Duration animationDuration = const Duration(milliseconds: 200);
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    animationController =
        AnimationController(vsync: this, duration: animationDuration);
  }

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double defaultRegisterSize = size.height * 0.8;

    containerSize = Tween<double?>(
            begin: size.height * 0.1, end: defaultRegisterSize)
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.linear));
    return widget.authMode == AuthMode.none
        ? Text(
            "Don't have an account ? Sign Up",
            style: TextStyle(color: AppColors.amber, fontSize: 18),
          )
        : SingleChildScrollView(
            controller: _scrollController,
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.cancelCallback != null)
                    CancelButton(
                        animationDuration: animationDuration * 4,
                        isLogin: widget.authMode == AuthMode.none,
                        onTap: widget.cancelCallback),
                  if (widget.cancelCallback != null)
                    const Text('Welcome Back',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24)),
                  if (widget.authMode == AuthMode.login &&
                      widget.cancelCallback == null)
                    const SizedBox(height: 40),
                  AnimatedOpacity(
                    duration: animationDuration,
                    opacity: widget.authMode == AuthMode.register ? 1 : 0,
                    child: widget.authMode == AuthMode.register
                        ? const RoundedInput(
                            icon: Icons.face_rounded, hintText: 'Name')
                        : null,
                  ),
                  AnimatedOpacity(
                    duration: animationDuration,
                    opacity: widget.authMode == AuthMode.register ? 1 : 0,
                    child: widget.authMode == AuthMode.register
                        ? const RoundedInput(
                            icon: Icons.face_rounded, hintText: 'Username')
                        : null,
                  ),
                  AnimatedOpacity(
                    duration: animationDuration,
                    opacity: widget.authMode == AuthMode.register ? 1 : 0,
                    child: widget.authMode == AuthMode.register
                        ? RoundedInput(
                            controller: _emailController,
                            icon: Icons.mail,
                            hintText: 'Email')
                        : null,
                  ),

                  AnimatedOpacity(
                    duration: animationDuration,
                    opacity: widget.authMode == AuthMode.login ? 1 : 0,
                    child: widget.authMode == AuthMode.login
                        ? RoundedInput(
                            controller: _passwordController,
                            icon: Icons.mail,
                            hintText: 'Email or username')
                        : null,
                  ),

                  RoundedPasswordInput(icon: Icons.lock, hintText: 'Password'),
                  AnimatedOpacity(
                    duration: animationDuration,
                    opacity: widget.authMode == AuthMode.register ? 1 : 0,
                    child: widget.authMode == AuthMode.register
                        ? const RoundedInput(
                            icon: Icons.lock,
                            hintText: 'Re-enter your Password')
                        : null,
                  ),
                  RoundedButton(
                      txtColor: AppColors.white,
                      title: widget.authMode.label,
                      bgColor: AppColors.blue,
                      tapEvent: () => AuthenticationBloc().add(AuthenticateUser(
                              authMode: widget.authMode,
                              authMethod: AuthMethod.emailPassword,
                              credentials: {
                                'email': _emailController.text,
                                'password': _passwordController.text
                              }))),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      SizedBox(
                          width: 140,
                          child: Divider(
                            thickness: 1,
                          )),
                      Text(' OR '),
                      SizedBox(
                          width: 140,
                          child: Divider(
                            thickness: 1,
                          ))
                    ],
                  ),
                  const SizedBox(height: 5),
                  //Socials Login
                  RoundedButton(
                    txtColor: AppColors.white,
                    title: 'Sign Up with GitHub',
                    image: 'icons/github.png',
                    bgColor: AppColors.black.withAlpha(127),
                    tapEvent: () async {
                      AuthenticationBloc().add(AuthenticateUser(
                          authMode: AuthMode.none,
                          authMethod: AuthMethod.github));

                      FirebaseAuth.instance.userChanges().listen((user) {
                        // context
                        //     .read<SideNavigationBloc>()
                        //     .add(NavigateTo(SideNavigationIndex.profile));
                        makeToast(
                            msg: "User Successfull Logged in With github",
                            type: 'debug',
                            context: context);
                        Navigator.pushNamed(context, '/home');
                      },
                          onError: (e) => makeToast(
                              msg: "Error Occured when in authentication",
                              type: 'alert',
                              context: context),
                          onDone: () => makeToast(
                              msg: "User Successfull Logged in With Github",
                              type: 'debug',
                              context: context));
                    },
                  ),

                  RoundedButton(
                    txtColor: AppColors.blue,
                    title: 'Sign Up with Google',
                    image: 'icons/google.png',
                    bgColor: AppColors.white,
                    tapEvent: () {
                      AuthenticationBloc().add(AuthenticateUser(
                          authMode: AuthMode.none,
                          authMethod: AuthMethod.google));

                      FirebaseAuth.instance.userChanges().listen((user) {
                        // context
                        //     .read<SideNavigationBloc>()
                        //     .add(NavigateTo(SideNavigationIndex.profile));
                        makeToast(
                            msg: "User Successfull Logged in With Google",
                            type: 'debug',
                            context: context);
                        Navigator.pushNamed(context, '/home',
                            arguments: {'user', user!});
                      },
                          onError: (e) => makeToast(
                              msg:
                                  "Error Occured when in authentication, please Check your network cnnexion and retry",
                              type: 'alert',
                              context: context),
                          onDone: () => makeToast(
                              msg: "User Successfull Logged in With Google",
                              type: 'debug',
                              context: context));
                    },
                  ),
                  InkWell(
                    onTap: widget.changeAuthMode,
                    child: Text(
                      widget.authMode.changeText,
                      style: TextStyle(color: AppColors.amber, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
