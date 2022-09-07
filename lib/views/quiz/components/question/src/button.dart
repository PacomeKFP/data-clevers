import 'package:aptitudes/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizButton extends StatelessWidget {
  const QuizButton({
    Key? key,
    required this.label,
    required this.tapCallback,
  }) : super(key: key);

  final String label;
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
            borderRadius: BorderRadius.circular(60),
            border: Border.all(color: AppColors.softBlue, width: 3),
            color: AppColors.darkBlue.withOpacity(0.8)),
        child: Text(
          label,
          style: GoogleFonts.quicksand(
              color: AppColors.softBlue,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
