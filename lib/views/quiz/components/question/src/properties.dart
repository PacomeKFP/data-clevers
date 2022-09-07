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
      required this.neonController})
      : super(key: key);

  final QuizModel quizModel;
  final QuestionModel questionModel;
  final CountDownController neonController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Color> gradientColors = List<Color>.generate(
        9, (index) => AppColors.purple.withOpacity(index / 10 + 0.1)).toList();
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 13.0,
                  spreadRadius: 0,
                )
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
          child: NeonCircularTimer(
              width: size.width * 2 / 6,
              duration: questionModel.time,
              controller: neonController,
              strokeWidth: 10,
              isTimerTextShown: true,
              neumorphicEffect: true,
              outerStrokeColor: Colors.grey.shade100,
              innerFillGradient: LinearGradient(colors: gradientColors),
              neonGradient: LinearGradient(colors: gradientColors),
              strokeCap: StrokeCap.round,
              innerFillColor: Colors.black12,
              backgroudColor: Colors.grey.shade100,
              neonColor: Colors.purpleAccent),
        )
      ],
    );
  }
}
