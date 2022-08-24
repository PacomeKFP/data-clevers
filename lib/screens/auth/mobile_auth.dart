import 'package:dc_apptitudes/config/colors.dart';
import 'package:dc_apptitudes/screens/auth/auth_mode.model.dart';
import 'package:dc_apptitudes/screens/auth/forms/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class MobileAuthScreen extends StatefulWidget {
  const MobileAuthScreen({Key? key}) : super(key: key);

  @override
  State<MobileAuthScreen> createState() => _MobileAuthScreenState();
}

class _MobileAuthScreenState extends State<MobileAuthScreen>
    with SingleTickerProviderStateMixin {
  late AuthMode authMode;

  late Animation<double?> containerSize;
  late AnimationController animationController;
  Duration animationDuration = const Duration(milliseconds: 200);
  @override
  void initState() {
    super.initState();
    authMode = AuthMode.none;

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

    return GestureDetector(
      onTap: authMode != AuthMode.none
          ? null
          : () {
              animationController.forward();
              setState(() {
                authMode = AuthMode.login;
              });
            },
      child: Container(
        color: Colors.white24,
        height: MediaQuery.of(context).size.height,
        child: AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget? child) {
            return Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: containerSize.value,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                    ),
                    color: AppColors.softBlue),
                child: AuthForm(
                  authMode: authMode,
                  cancelCallback: () {
                    animationController.reverse();
                    print('object');
                    setState(() {
                      authMode = AuthMode.none;
                    });
                  },
                  changeAuthMode: () {
                    setState(() {
                      authMode = authMode == AuthMode.login
                          ? AuthMode.register
                          : AuthMode.login;
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
 
}
