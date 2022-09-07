import 'dart:developer';

import 'package:aptitudes/models/models.dart';
import 'package:faker_dart/faker_dart.dart';
import 'components/question/question.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
//
  ///The quiz model we will use
  QuizModel quizModel = QuizModel(
      subject: "Python for DataScience",
      totalTime: "12 mins",
      imageUrl: "assets/gifs/python.gif",
      xp: 750,
      questionsNumber: 12);

  ///The list of questions we will ask to the user
  List<QuestionModel> quizQuestions = [];

  ///The list of the Answers the user will give to us
  List<UserAnswerModel> userAnswers = [];

  ///the index in [quizQuestions] of the current question
  ///We begin with the first question
  int currentQuestionIndex = 0;

//
  @override
  void initState() {
    quizQuestions.add(QuestionModel(
        id: Faker.instance.datatype.hexaDecimal(),
        course: "Python for DataScience",
        category: "DataScience",
        level: 3,
        question: "In which year python has been released for the first time ?",
        choices: ["2004", "1990", "1991", "1989"],
        answer: ["1991"],
        hasMultipleAnswer: false,
        time: 30));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        // width: size.width,
        height: size.height,
        padding: EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: QuizQuestion(
            quizModel: quizModel,
            index: currentQuestionIndex + 1,
            onSubmit: (List<String> choices, int elapsedTime) {
              var userAnswerModel = UserAnswerModel(
                  questionId: quizQuestions[currentQuestionIndex].id!,
                  choices: choices,
                  elapsedTime: elapsedTime);
              userAnswers
                      .where((element) =>
                          element.questionId == userAnswerModel.questionId)
                      .toList()
                      .isEmpty
                  ? userAnswers.add(userAnswerModel)
                  : log("Response already submitted");

              log("Question submitted ${elapsedTime.toString()}");
              print(userAnswers.toString());
            },
            question: quizQuestions[currentQuestionIndex],
          ),
        ),
      ),
    );
  }
}
