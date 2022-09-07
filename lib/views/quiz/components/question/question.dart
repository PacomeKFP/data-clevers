import 'package:aptitudes/config/colors.dart';
import 'package:aptitudes/models/models.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'src/button.dart';
import 'src/properties.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer';

class QuizQuestion extends StatefulWidget {
  const QuizQuestion(
      {Key? key,
      required this.quizModel,
      required this.index,
      required this.question,
      required this.onSubmit})
      : super(key: key);

  final QuizModel quizModel;
  final int index;
  final QuestionModel question;
  final void Function(List<String> choices,  int elapsedTime) onSubmit;

  @override
  State<QuizQuestion> createState() => _QuizQuestionState();
}

class _QuizQuestionState extends State<QuizQuestion> {
  List<String> choices = [];
    CountDownController neonController = CountDownController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 7 / 8,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Quiz on ${widget.quizModel.subject}",
              style: GoogleFonts.poppins(
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkBlue.withOpacity(0.8))),
          const SizedBox(height: 10),
          Text("Answer the following question",
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: AppColors.darkBlue.withOpacity(0.6),
              )),
          const SizedBox(height: 10),
          QuestionHeader(
            quizModel: widget.quizModel,
            neonController: neonController,
            questionModel: widget.question,
          ),
          const SizedBox(height: 20),
          Text(
            "Choose answer(s)",
            style: GoogleFonts.poppins(
              fontSize: 23,
              color: AppColors.darkBlue.withOpacity(0.8),
            ),
          ),

          /// here we have to display differents answers

          ...widget.question.choices
              .map((choice) => CheckboxListTile(
                  value: choices.contains(choice),
                  title: Text(
                    choice,
                    style: GoogleFonts.quicksand(
                        color: AppColors.darkBlue.withOpacity(0.6),
                        fontSize: 19,
                        fontWeight: FontWeight.w600),
                  ),
                  onChanged: (e) => setState(() {
                        choices.contains(choice)
                            ? choices.remove(choice)
                            : choices.add(choice);
                      })))
              .toList(),

          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            QuizButton(
              label: "Start",
              tapCallback: () =>
                  widget.onSubmit(choices, neonController.getTimeInSeconds()),
            )
          ]),
        ],
      ),
    );
  }
}
