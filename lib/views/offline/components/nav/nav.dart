import 'package:aptitudes/config/logo.dart';
import 'package:aptitudes/views/auth/desktop_auth.dart';
import 'src/get_started_button.dart';
import 'src/item.dart';
import 'package:flutter/material.dart';

class OutNavBar extends StatelessWidget {
  const OutNavBar({super.key, required this.keys});
  final List<GlobalKey> keys;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Wrap(
          spacing: 5,
          children: [const SizedBox(width: 15), AppGlobals.logo()],
        ),
        Wrap(
          spacing: 20,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            OutNavItem(
                title: 'Our Trainings              '.trim(),
                dataKey: keys[0]), //slider
            OutNavItem(
                title: 'Why us ?', dataKey: keys[1]), //Discover your potential
            OutNavItem(
                title: "The Right Course",
                dataKey: keys[2]), //find the right course

            NavLoginButton(
              tapCallback: () => showDialog(
                  context: context, builder: (context) => DesktopAuthScreen()),
            ), //go to Quiz
            const SizedBox(width: 10),
          ],
        ),
      ],
    );
  }
}
