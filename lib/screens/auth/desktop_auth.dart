import 'package:dc_apptitudes/screens/auth/auth_mode.model.dart';
import 'package:dc_apptitudes/screens/auth/forms/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/colors.dart';

class DesktopAuthScreen extends StatefulWidget {
  const DesktopAuthScreen({Key? key}) : super(key: key);

  @override
  State<DesktopAuthScreen> createState() => _DesktopAuthScreenState();
}

class _DesktopAuthScreenState extends State<DesktopAuthScreen>
    with SingleTickerProviderStateMixin {
  late AuthMode authMode;

  late Animation<double?> containerSize;
  late AnimationController animationController;
  Duration animationDuration = const Duration(milliseconds: 200);
  @override
  void initState() {
    super.initState();
    authMode = AuthMode.login;

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    animationController =
        AnimationController(vsync: this, duration: animationDuration);
  }


  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 2 / 3;
    return AlertDialog(
      backgroundColor:AppColors.softBlue,
      // contentPadding: EdgeInsets.all(0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      // actions: [],
      content: Container(
        alignment: Alignment.center,
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all( Radius.circular(30)),
                  
                ),
                width: double.infinity,
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              flex: 1,
              child: AuthForm(
                authMode: authMode,
                changeAuthMode: () {
                  setState(() {
                    authMode = authMode == AuthMode.login
                        ? AuthMode.register
                        : AuthMode.login;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
