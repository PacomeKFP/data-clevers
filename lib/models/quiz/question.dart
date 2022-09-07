class QuestionModel {
  ///the [$oid] of the question in database
  final String? id;

  ///The category of the question
  ///Category can be: Final Exam, Simple Test, Practice test or other more
  final String? category;

  ///[$oid] of the category

  /// the course id of wich the question is taken
  final String? course;

  ///[$oid] of the course

  ///The difficulty level of the question
  final int level;

  ///the Question asked to the user
  final String question;

  ///choice of answers offered to the user
  final List<String> choices;

  //the correct answer for the question
  final List<String> answer;

  ///inform if the is one or multiple answer for the question
  ///this will not be used for a fisrt time,
  ///we will  suppose that all question cant have only one or more than one answer
  final bool hasMultipleAnswer;

  ///The time allowed for the question in seconds
  final int time;

  QuestionModel(
      {this.id,
      this.category,
      this.course,
      required this.level,
      required this.question,
      required this.choices,
      required this.answer,
      required this.hasMultipleAnswer,
      required this.time});
}
