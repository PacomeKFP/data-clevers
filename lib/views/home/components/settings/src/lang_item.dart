import 'package:aptitudes/models/languages/lang.dart';
import 'package:flutter/material.dart';

class LanguageSetting extends StatefulWidget {
  const LanguageSetting({Key? key}) : super(key: key);

  @override
  State<LanguageSetting> createState() => _LanguageSettingState();
}

class _LanguageSettingState extends State<LanguageSetting> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text('Application language'),
      DropdownButton<AppLanguages>(items: [], onChanged:(e)=> (){})
    ],);
  }
}