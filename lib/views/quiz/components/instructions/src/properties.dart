import 'package:aptitudes/config/colors.dart';
import 'package:aptitudes/models/models.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizInstructionsProps extends StatelessWidget {
  const QuizInstructionsProps(this.quizModel, {Key? key}) : super(key: key);

  final QuizModel quizModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Wrap(
      crossAxisAlignment:WrapCrossAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 13.0,
                    spreadRadius: 0,)
              ]),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            child: Image.network(quizModel.imageUrl,
                width: size.width * 2 / 6, fit: BoxFit.fill),
          ),
        ),
        Container(
          // margin: EdgeInsets.only(left:size.width * 0.5 / 6),
          width: size.width * 3 / 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Number of Questions",
                      style: GoogleFonts.poppins(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkBlue.withOpacity(0.8)),
                    ),
                    Text(
                      "Total time",
                      style: GoogleFonts.poppins(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkBlue.withOpacity(0.8)),
                    ),
                    Text(
                      "XP Point ",
                      style: GoogleFonts.poppins(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkBlue.withOpacity(0.8)),
                    ),
                  ]),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${quizModel.questionsNumber} Questions",
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: AppColors.darkBlue.withOpacity(0.6)),
                    ),
                    Text(
                      quizModel.totalTime,
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: AppColors.darkBlue.withOpacity(0.6)),
                    ),
                    Text(
                      quizModel.xp.toString(),
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: AppColors.darkBlue.withOpacity(0.6)),
                    ),
                  ])
            ],
          ),
        )
      ],
    );
  }
}
