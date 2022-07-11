import 'package:flutter/cupertino.dart';

class Globals {
  String projectName;
  Color green;
  Color darkBlue;
  Color grey;
  Color white;
  Color skyBlue;

  Globals(
      {this.projectName = "DataClevers",
      this.green = const Color.fromARGB(255, 203, 234, 195),
      this.darkBlue = const Color.fromARGB(255, 0, 69, 98),
      this.grey= const Color(0xffD9D9D9),
      this.white = const Color(0xffF7F7F7),
      this.skyBlue = const Color(0xffF7F7F7)});

  String getProjectName() {
    return projectName.toString();
  }
}
