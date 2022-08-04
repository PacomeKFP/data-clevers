import 'package:data_clevers/config/config.dart';
import 'package:data_clevers/models/formField.model.dart';
import 'package:flutter/material.dart';

class FormularqField extends StatelessWidget {
  final String label;
  final String hintText;
  final String defaultValue;
  final bool isRequired;
  final TextEditingController? controller;

  const FormularqField(
      {super.key,
      required this.label,
      required this.hintText,
      required this.defaultValue,
      required this.isRequired,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: 400,
      child: TextFormField(
        controller: controller,
        initialValue: defaultValue,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
        ),
        validator: (val) => ((val == null || val.isEmpty) && isRequired)
            ? 'Champ obligatoire'
            : null,
      ),
    );
  }
}

class Formular extends StatelessWidget {
  final Widget? header;
  final String? title;
  final String libelle;

  final List<FormularField> fields;
  const Formular(
      {Key? key,
      required this.title,
      required this.libelle,
      required this.fields,
      this.header})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 500,
      decoration: BoxDecoration(border: Border.all(width: 2)),
      child: Column(
        children: [
          header ?? const Divider(),
          if (header != null) const SizedBox(height: 10),
          Form(
              child: Column(
            children: [
              Column(
                children: [
                  Text(title!, style: Theme.of(context).textTheme.headline4!),
                  Text(libelle, style: Theme.of(context).textTheme.bodyMedium!),
                  const SizedBox(height: 10),
                ],
              ),
              Column(
                children: List<FormularField>.generate(
                    fields.length, (index) => fields[index]),
              )
            ],
          )),
        ],
      ),
    );
  }
}

class FormTester extends StatelessWidget {
  const FormTester({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<FormularField> fields = [];
    fields.add(const FormularField(
        label: 'Name', defaultValue: '', isRequired: false));
    fields.add(const FormularField(
        label: 'Surname', defaultValue: 'Pacome', isRequired: false));
    fields.add(const FormularField(
        label: 'Email', defaultValue: '', isRequired: true));
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            child: Formular(
                header: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('Experience')),
                title: 'about',
                libelle: 'Say Us more about your personality',
                fields: fields)),
      ),
    );
  }
}
