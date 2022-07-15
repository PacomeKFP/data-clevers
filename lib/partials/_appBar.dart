import 'package:data_clevers/partials/btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../settings/Colors.dart';
import '../settings/globals.dart';

class applicationBar {
  Widget getAppBar({path = "../../assets/images/avatar.jpeg"}) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Globals().AppLogo(),
                SizedBox(width: 5),
                Text(Globals().projectName, style: TextStyle(color: Clors().darkBlue), ),
                SizedBox(width: 5),
                DecoratedBox(
                  decoration: BoxDecoration(
                      color: Clors().darkBlue,
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(50),
                          right: Radius.circular(50))),
                  child: Wrap(children: [
                    btn1()
                  ]),
                )
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: CircleAvatar(
                backgroundImage: AssetImage(path),
                radius: 20,
              ))
        ],
      ),
    );
  }
}
