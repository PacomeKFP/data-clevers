import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckedLine extends StatelessWidget {
  const CheckedLine({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Feather.check, color: Colors.lightBlue),
      title: Text(
        label,
        style: GoogleFonts.roboto(color: Colors.grey, fontSize: 18),
      ),
    );
  }
}
