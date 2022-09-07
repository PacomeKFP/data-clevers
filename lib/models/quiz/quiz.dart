import 'package:aptitudes/models/quiz/question.dart';

class QuizModel {
  //Will correspond to the course on which the quiz is based on
  final String subject;
  final String totalTime;
  final String imageUrl;
  final int xp;
  final int questionsNumber;
  // final List<QuestionModel>? questions;

  

  QuizModel(
      {required this.subject,
      required this.totalTime,
      required this.imageUrl,
      required this.xp,
      required this.questionsNumber});
}
