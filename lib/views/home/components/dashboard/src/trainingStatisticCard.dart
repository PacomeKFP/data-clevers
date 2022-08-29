part of home.components;

class TrainingStatisticsCards extends StatelessWidget {
  const TrainingStatisticsCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
       TrainingStatisticsCard(
          count: 125,
          name: "All finished Courses",
          description: "2 Trainings out of time",
          progress: 0.75,
          color: AppColors.amber),
       TrainingStatisticsCard(
          count: 1105,
          name: "Courses Interest",
          description: "+ 576 new courses",
          progress: 0.75,
          color: AppColors.purple)
    ]);
  }
}

class TrainingStatisticsCard extends StatelessWidget {
  const TrainingStatisticsCard(
      {Key? key,
      required this.count,
      required this.name,
      required this.description,
      required this.progress,
      required this.color})
      : super(key: key);

  final int count;
  final String name;
  final String description;
  final double progress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 40, right: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 85,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$count',
                    style: GoogleFonts.quicksand(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.softBlue),
                  ),
                  Text(
                    name,
                    style: GoogleFonts.quicksand(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color:  AppColors.softBlue),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: GoogleFonts.quicksand(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.softBlue),
                  ),
                ]),
          ),
          CircularPercentIndicator(
            radius: 25,
            lineWidth: 4.5,
            percent: progress,
            circularStrokeCap: CircularStrokeCap.round,
            center: Text(
              '${progress * 100} %',
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.w700,
                color: AppColors.softBlue,
                fontSize: 13,
              ),
            ),
            progressColor: Colors.white,
            startAngle: 270,
            backgroundColor: Colors.white54,
          )
        ]),
      ),
    );
  }
}
