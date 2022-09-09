import 'package:aptitudes/config/colors.dart';
import 'package:aptitudes/models/models.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

class QuestionHeader extends StatelessWidget {
  const QuestionHeader(
      {Key? key,
      required this.quizModel,
      required this.questionModel,
      required this.neonController,
      required this.index,
      required this.onComplete})
      : super(key: key);

  final QuizModel quizModel;
  final QuestionModel questionModel;
  final CountDownController neonController;
  final int index;
  final void Function() onComplete;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Color> gradientColors = [
      Colors.greenAccent,
      Colors.lightGreen,
      Colors.lightGreen,
      Colors.amberAccent,
      Colors.amber,
      Colors.redAccent,
      Colors.red
    ];

    gradientColors = gradientColors.reversed.toList();
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Container(
          width: size.width * 2 / 6,
          decoration: BoxDecoration(
            color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 13.0,
                  spreadRadius: 0,
                )
              ]),
          child: Column(
            children: [
              Text("Question: $index/10",
                  style: GoogleFonts.poppins(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkBlue.withOpacity(0.8))),
              const SizedBox(height: 10),
              Text(questionModel.question,
                  style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                      color: AppColors.darkBlue.withOpacity(0.6)))
            ],
          ),
        ),
        SizedBox(
          // margin: EdgeInsets.only(left:size.width * 0.5 / 6),
          width: 100,
          child: NeonCircularTimer(
              width: size.width * 2 / 6,
              duration: questionModel.time,
              controller: neonController,
              onComplete: onComplete,
              strokeWidth: 10,
              isTimerTextShown: true,
              neumorphicEffect: true,
              // outerStrokeColor: Colors.grey.shade100,
              innerFillGradient: LinearGradient(colors: gradientColors),
              neonGradient: LinearGradient(colors: gradientColors),
              strokeCap: StrokeCap.round,
              innerFillColor: Colors.black12,
              backgroudColor: AppColors.softBlue,
              neonColor: Colors.blue),
        )
      ],
    );
  }
}
