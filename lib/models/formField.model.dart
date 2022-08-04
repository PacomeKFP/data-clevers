import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FormularField extends StatefulWidget {
  final String label;
  final String? hintText;
  final bool isRequired; //false
  final bool isObscurable; //false
  final TextInputType inputType;
  final String? defaultValue;
  final TextEditingController? controller;
  final Type type;

  const FormularField(
      {Key? key,
      required this.label,
      this.hintText,
      this.isRequired = false,
      this.isObscurable = false,
      this.inputType = TextInputType.text,
      required this.defaultValue,
      this.controller,
      this.type = String})
      : super(key: key);

  @override
  State<FormularField> createState() => FormularFieldState();
}

class FormularFieldState extends State<FormularField> {
  bool hidden = false;
  _hide() {
    setState(() {
      hidden = !hidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isObscurable == true)
      hidden = true;
    else
      hidden = false;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FormField<dynamic>(
          key: GlobalKey<FormState>(),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if ((value == null || value.isEmpty) && widget.isRequired) {
              return 'This field is required';
            }
            return null;
          },
          builder: (context) {
            return TextFormField(
              initialValue: widget.defaultValue,
              obscureText: hidden,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:
                      widget.hintText == null ? widget.label : widget.label,
                  labelText: widget.label,
                  suffixIcon: widget.isObscurable
                      ? (hidden
                          ? FaIcon(FontAwesomeIcons.eyeSlash)
                          : FaIcon(FontAwesomeIcons.eye))
                      : null),
            );
          }),
    );
  }
}
