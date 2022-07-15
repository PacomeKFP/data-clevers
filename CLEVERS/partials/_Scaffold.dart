import 'package:data_clevers/partials/_appBar.dart';
import 'package:data_clevers/settings/Colors.dart';
import 'package:flutter/material.dart';

import '_sidemenu.dart';

class Scaffolder {


  Scaffold getScaffold({
    required BuildContext context,
    required Widget Home,
    required callback,
  }) {
    List<SideBlockItem> items = [
      SideBlockItem("Formation", "Formation"),
      SideBlockItem("Cours", "cours"),
      SideBlockItem("Evaluation", "Evaluation")
    ];
    List<SideBlock> blocks = <SideBlock>[SideBlock("Categorie", items)];

    if (MediaQuery.of(context).size.width < 820) {
      return Scaffold(
          drawer: Drawer(
            width: MediaQuery.of(context).size.width * 0.6,
            child: SideMenu(
              context: context,
              blocks: blocks,
              activeKey: "cours",
              callback: callback,
            ),
          ),
          appBar: AppBar(
            title: applicationBar().getAppBar(),
            iconTheme: IconThemeData(color: Clors().darkBlue),
          ),
          body: SafeArea(child: Home));
    }

    return Scaffold(
        appBar: AppBar(
          title: applicationBar().getAppBar(),
        ),
        body: SafeArea(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SideMenu(
              context: context,
              blocks: blocks,
              activeKey: "cours",
              callback: callback,
            ),
            Home
          ],
        )));
  }
}
