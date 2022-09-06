import '../../models/models.dart';
import 'forms/auth_form.dart';
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
      actions: [CloseButton(color: AppColors.purple ,onPressed: () => Navigator.of(context).pop())],
      backgroundColor: AppColors.softBlue,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
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
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  width: double.infinity,
                  child: Image.asset("gifs/authenticate.gif", height: 600)),
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
