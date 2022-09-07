///this class [UserAnswerModel] help to descrbe the Ansxer of a user fo a Question
class UserAnswerModel {
  /// The list of choices made by  the user
  final List<String> choices;

  /// the time taken by the user to answer
  final int elapsedTime;

  /// the [$oid] of the question
  final String questionId;

  UserAnswerModel(
      {required this.questionId,
      required this.choices,
      required this.elapsedTime});
  

  @override
  String toString() {
    String str =
        "Instance of \$ \n\t user choices --> ${choices.toString}"
        "\n\t elsapedTime--> $elapsedTime on question $questionId";
    return str;
  }
}
