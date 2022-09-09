import 'package:aptitudes/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppGlobals {
  // static Widget logo() => Image.asset("icons/logo.png", );
  static Widget logo({double? fontSize, Color? lblColor, Color? bgColor}) => Text("DC",
      style: GoogleFonts.quicksand(
          fontSize: 42,
          fontWeight: FontWeight.w900,
          color: lblColor?? AppColors.darkBlue,
          backgroundColor: bgColor ?? AppColors.white));
  static Widget appName({double? fontSize, Color? lblColor, Color? bgColor}) =>
      Text(
        "DataClevers",
        style: GoogleFonts.poppins(
            fontSize: fontSize ?? 24,
            color: lblColor,
            backgroundColor: bgColor),
      );
  AppGlobals._();
}
