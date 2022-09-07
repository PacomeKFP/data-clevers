import 'package:aptitudes/config/colors.dart';
import 'package:aptitudes/models/models.dart';
import 'package:aptitudes/views/quiz/components/instructions/src/button.dart';
import 'src/properties.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer';  

class QuizInstructions extends StatelessWidget {
  const QuizInstructions({Key? key, required this.quizModel}) : super(key: key);

  final QuizModel quizModel;

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
          Text("Quiz on ${quizModel.subject}",
              style: GoogleFonts.poppins(
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkBlue.withOpacity(0.8))),
          const SizedBox(height: 10),
          Text("Read the following instructions",
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: AppColors.darkBlue.withOpacity(0.6),
              )),
          const SizedBox(height: 10),
          QuizInstructionsProps(quizModel),
          const SizedBox(height: 20),
          Text(
            "Instructions",
            style: GoogleFonts.poppins(
              fontSize: 23,
              color: AppColors.darkBlue.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "This quiz consists of ${quizModel.questionsNumber} multiple-choice questions. To be successful with the quizzes,"
            " it’s important to conversant with the topics. Keep the following in mind:\n\n"
            "Timing -each question has an allowed time. You need to complete the question before it time expire \n"
            "Answers - it is possible to have multiple response on a question, and when you validate your answer,"
            " we tell you if your response is correct or not\n"
            "XP - each question help you to earn some experiences points that are helpful in the app flow\n\n"
            "To start, click the \"Start\" button. When finished, click the \"Submit \" button.\n\n",
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: AppColors.darkBlue.withOpacity(0.6),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            QuizButton(
                bgColor: AppColors.darkBlue.withOpacity(0.8),
                label: "Start",
                lblColor: AppColors.softBlue,
                tapCallback: () => log("Start quiz"))
          ]),
        ],
      ),
    );
  }
}
