import 'package:data_clevers/partials/_Scaffold.dart';
import 'package:data_clevers/partials/_sidemenu.dart';
import 'package:data_clevers/partials/_appBar.dart';
import 'package:data_clevers/views/main.view.dart';

import 'settings/globals.dart';
import 'package:flutter/material.dart';

Globals globals = Globals();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: globals.projectName,
      theme: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color.fromARGB(255, 250, 250, 250),
            ),
      ),
      home: MyHomePage(title: globals.projectName.toString()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String activeMenuKey = "cours";

  void handlesideMenuCallBack(String key) {
    setState(() {
      activeMenuKey = key;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffolder().getScaffold(
        context: context, Home:const MainPage(), callback: handlesideMenuCallBack);
  }
}


