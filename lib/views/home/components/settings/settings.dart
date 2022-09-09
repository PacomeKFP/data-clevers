import 'package:aptitudes/blocs/blocs.dart';
import 'package:aptitudes/config/colors.dart';
import 'package:aptitudes/models/models.dart';
import 'package:aptitudes/views/home/components/settings/src/jobs_settings.dart';
import 'package:aptitudes/views/home/components/settings/src/lang_settings.dart';
import 'package:aptitudes/views/home/components/settings/src/notifications_settings.dart';
import 'package:aptitudes/views/home/components/settings/src/theme_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        CloseButton(onPressed: () {
          context
              .read<SideNavigationBloc>()
              .add(NavigateTo(SideNavigationIndex.dashboard));
          Navigator.of(context).pop();
        })
      ],
      content: Column(
        children: const [
          LanguageSetting(),
          ThemeSettings(),
          NotificationSetting(),
          JobSetting()
        ],
      ),
    );
  }
}
