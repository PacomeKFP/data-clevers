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

    TrainingTabIndex _trainingTab = TrainingTabIndex.current;
    String a = "sdf";
    void _changeTab(TrainingTabIndex selectedTab) {
      print('yo');
      setState(() {
        _trainingTab = selectedTab;
        a = "selectedTab.label";
        print(a);
      });
      print(_trainingTab.label);
    }

    void test() {
      setState(() {
        a = "chien";
      });
    }

    return Expanded(
      flex: 4,
      child: Container(
        height: size.height,
        color: AppColors.softBlue,
        child: SingleChildScrollView(
          controller: _firstScrollController,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: const EdgeInsets.only(left: 30, top: 25, bottom: 15),
              child: InkWell(
                onTap: () {
                  showDialog(context: context, builder: (context)=>AlertDialog(content: Text('yo'),));
                },
                child: Text(
                  "Ongoing Trainings",
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
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
            const SubHeader(title: "Shared Files"),
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

            // const SharedFilesItem(
            //   color: Colors.amber,
            //   sharedFileName: "Company Policy",
            //   membersNumber: 38,
            //   date: "10 Sep. 2022",
            //   fileSize: "4.2 MB",
            // ),
            // const SharedFilesItem(
            //   color: Colors.red,
            //   sharedFileName: "Wireframes",
            //   membersNumber: 14,
            //   date: "01 Oct. 2022",
            //   fileSize: "1.7 MB",
            // ),

            //Projects Statistics
            const SubHeader(title: "Project Statistics"),
            const TrainingStatisticsCards(),
          ]),
        ),
      ),
    );
  }
}

