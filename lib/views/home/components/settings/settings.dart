import 'package:aptitudes/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer';

class AppSettings extends StatefulWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(
        "Applications Settings",
        style: GoogleFonts.ubuntu(),
      ),
      backgroundColor: AppColors.softBlue.withOpacity(0.6),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(60),
      )),
      actions: [
        ElevatedButton(
          
            onPressed: () => log('Close Settings'),
            child: Text('Close Settings'))
      ],
      content: Column(
        children: [
          Row()
        ],
      ),
    );
  }
}
