import 'package:data_clevers/settings/colors.dart';
import 'package:flutter/material.dart';

class Globals {
  String projectName;

  Globals({this.projectName = "DataClevers"});

  String getProjectName() {
    return projectName.toString();
  }

  // ignore: non_constant_identifier_names
  Widget AppLogo() {
    return Container(
        width: 48,
        height: 44,
        color: Clors().darkBlue,
        child: const Center(
          child: Text(
            "DC",
            style: TextStyle(fontFamily: 'Ubuntu'),
          ),
        ));
  }
}
