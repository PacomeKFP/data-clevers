import 'package:aptitudes/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizButton extends StatelessWidget {
  const QuizButton(
      {Key? key,
      required this.bgColor,
      required this.label,
      required this.lblColor, required this.tapCallback})
      : super(key: key);

  final Color bgColor;
  final String label;
  final Color lblColor;
  final GestureTapCallback tapCallback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapCallback,
      splashColor: Colors.white,
      hoverColor: AppColors.softBlue.withOpacity(0.6),
      customBorder:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
      child: AnimatedContainer(
        curve: Curves.fastLinearToSlowEaseIn,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        duration: const Duration(milliseconds: 2000),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: AppColors.softBlue, width: 3),
            color: bgColor),
        child: Text(
          label,
          style: GoogleFonts.quicksand(
              color: lblColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
