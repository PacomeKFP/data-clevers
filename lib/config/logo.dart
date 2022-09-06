import 'package:aptitudes/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppGlobals {
  // static Widget logo() => Image.asset("icons/logo.png", );
  static Widget logo() => Text("DC",
      style: GoogleFonts.quicksand(
          fontSize: 42,
          fontWeight: FontWeight.w900,
          color: AppColors.darkBlue,
          backgroundColor: AppColors.white));
  static Widget appName({double? fontSize})=> Text(
        "DataClevers",
        style: GoogleFonts.poppins(fontSize: fontSize ?? 24),
      );
  AppGlobals._();
}
