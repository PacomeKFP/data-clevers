part of home.components;

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    ScrollController _firstScrollController = ScrollController();
    Size size = MediaQuery.of(context).size;

    return Expanded(
      child: Container(
        height: size.height,
        color: AppColors.softBlue,
        child: SingleChildScrollView(
          controller: _firstScrollController,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ProfileHeaderUser(),
            Container(
              margin: const EdgeInsets.only(left: 30, top: 25, bottom: 15),
              child: Text(
                  "Ongoing Trainings",
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
            ),
            TrainingTabs(),

            Container(
              // padding: const EdgeInsets.symmetric(horizontal: 10.0),
              height: 225,
              child: Scrollbar(
                controller: _scrollController,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  child: Center(
                    child: Wrap(
                        direction: Axis.horizontal,
                        spacing: 12,
                        children: [
                          const SizedBox(width: 10),
                          TrainingProgressCard(
                              color: Colors.redAccent,
                              progressIndicatorColor: Colors.redAccent[100]!,
                              projectName: 'Data Analysis',
                              percentCompleted: 34,
                              icon: Feather.database),
                          TrainingProgressCard(
                              color: Colors.blueAccent,
                              progressIndicatorColor: Colors.blueAccent[100]!,
                              projectName: 'Machine Learning',
                              percentCompleted: 27,
                              icon: Feather.monitor),
                          TrainingProgressCard(
                              color: Colors.amber,
                              progressIndicatorColor: Colors.amberAccent[100]!,
                              projectName: 'Data Mining',
                              percentCompleted: 82,
                              icon: Feather.anchor),
                          TrainingProgressCard(
                              color: Colors.redAccent,
                              progressIndicatorColor: Colors.redAccent[100]!,
                              projectName: 'Data Analysis',
                              percentCompleted: 46,
                              icon: Feather.database),
                          TrainingProgressCard(
                              color: Colors.blueAccent,
                              progressIndicatorColor: Colors.blueAccent[100]!,
                              projectName: 'Machine Learning',
                              percentCompleted: 67,
                              icon: Feather.monitor),
                          const SizedBox(width: 10),
                        ]),
                  ),
                ),
              ),
            ),

            //Project Files
            const SubHeader(title: "Training Content"),
            const CourseLineItem(
              color: Colors.blue,
              title: "Python for DataScience",
              duration: '8 hours',
              instructor: 'The Instructor',
              progression: 1,
            ),
            const CourseLineItem(
              color: Colors.amber,
              title: "Mathematics for DataScience",
              duration: '6 hours',
              instructor: 'The Instructor',
              progression: 0.50,
            ),
          ]),
        ),
      ),
    );
  }
}
