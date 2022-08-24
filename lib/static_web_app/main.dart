import 'package:flutter/material.dart';

import 'components/components.dart';

class StaticWebApp extends StatefulWidget {
  const StaticWebApp({Key? key}) : super(key: key);

  @override
  State<StaticWebApp> createState() => _StaticWebAppState();
}

class _StaticWebAppState extends State<StaticWebApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            CustomNavigationBar()          
          ],
        ),
      ),
    );
  }
}