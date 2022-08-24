import 'package:dc_apptitudes/config/colors.dart';
import 'package:dc_apptitudes/screens/auth/auth_mode.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                      ? const RoundedInput(
                          icon: Icons.mail, hintText: 'Email')
                      : null,
                ),
          
                AnimatedOpacity(
                  duration: animationDuration,
                  opacity: widget.authMode == AuthMode.login ? 1 : 0,
                  child: widget.authMode == AuthMode.login
                      ? const RoundedInput(
                          icon: Icons.mail, hintText: 'Email or username')
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
                  tapEvent: () {},
                ),
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
                  tapEvent: () => print('Sign Up with Github'),
                ),
          
                RoundedButton(
                  txtColor: AppColors.blue,
                  title: 'Sign Up with Google',
                  image: 'icons/google.png',
                  bgColor: AppColors.white,
                  tapEvent: () => print("Sign Up with Google"),
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
