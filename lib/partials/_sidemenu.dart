// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:data_clevers/settings/Colors.dart';
import 'package:flutter/material.dart';

class SideBlock {
  String title = "";
  List<SideBlockItem> items = [];
  SideBlock(this.title, this.items);
}

class SideBlockItem {
  String title = "", itemId = "";
  SideBlockItem(this.title, this.itemId);
}

Widget SideMenu(
    {required BuildContext context,
    required List<SideBlock> blocks,
    required String activeKey,
    required void Function(String MenuKey) callback}) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;

  TextStyle activeStyle = const TextStyle(//style appliqué à un ongle de me,nu actif
      color: Colors.white, fontWeight: FontWeight.w900, fontSize: 24);
  TextStyle unactiveStyle = const TextStyle(//Style appliqué à un on glet demenu non actif
      color: Colors.white, fontWeight: FontWeight.w900, fontSize: 18);

  return Container(
    width: width *0.2,
    padding: EdgeInsets.symmetric(vertical: height/8,  ),
    color: Clors().darkBlue,
    child: ListView(children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: const Text("Mes Progres"),
            onTap: () => callback("evolution"),
          ),
        ),
      ),
      Divider(
                height: 1,
                indent: 10,
                color: Clors().grey,
              ),
      for (SideBlock bloc in blocks)
        ListTile(
          title: Center(child: Text(bloc.title.toUpperCase())),
          subtitle: Column(
            children: [
              for (SideBlockItem item in bloc.items)
                GestureDetector(
                  child: Text(
                    item.title,
                    style:
                        activeKey == item.itemId ? activeStyle : unactiveStyle,
                  ),
                  onTap: () => callback(item.itemId),
                ),
              Divider(
                height: 1,
                indent: 25,
                color: Clors().grey,
              )
            ],
          ),
        )
    ]),
  );
}
