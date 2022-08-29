import 'package:aptitudes/config/colors.dart';
import 'desktop_auth.dart';
import 'mobile_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationScreenDisplayer extends StatefulWidget {
  const AuthenticationScreenDisplayer({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreenDisplayer> createState() =>
      _AuthenticationScreenDisplayerState();
}

class _AuthenticationScreenDisplayerState
    extends State<AuthenticationScreenDisplayer>
    with SingleTickerProviderStateMixin {
  Duration animationDuration = const Duration(milliseconds: 200);
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: AppColors.blue,
                      child: const Text(
                        'Yo',
                        style: TextStyle(fontSize: 50),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
            context: context, builder: (context) => const DesktopAuthScreen()),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class GetAuth extends StatelessWidget {
  const GetAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = false;
    Size size = MediaQuery.of(context).size;
    if (size.width < size.height || size.width < 720) isMobile = true;

    if (isMobile) return const MobileAuthScreen();
    return GestureDetector(
      onTap: () => showDialog(
          context: context, builder: (context) => const DesktopAuthScreen()),
      child: SizedBox(
        height: size.height * 0.1,
        child: const Text("Sign Up"),
      ),
    );
  }
}
