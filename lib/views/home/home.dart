import 'package:flutter/material.dart';

import 'components/components.dart';


class UserHome extends StatelessWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: const [CustomNavigationBar(), Dashboard(), ],
        ),
      ),
    );
  }
}
