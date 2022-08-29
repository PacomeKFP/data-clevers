part of models;

enum TrainingTabIndex{
  all,
  current,
  pending,
  completed;

  String get label => this == TrainingTabIndex.all
      ? "All"
      : this == TrainingTabIndex.current
          ? "Current"
          : this == TrainingTabIndex.pending
              ? "Pending"
              : "Completed";

  Color get color => this == TrainingTabIndex.all
      ? Colors.indigoAccent
      : this == TrainingTabIndex.current
          ? Colors.orangeAccent
          : this == TrainingTabIndex.pending
              ? Colors.yellowAccent
              : Colors.lightGreenAccent;
}