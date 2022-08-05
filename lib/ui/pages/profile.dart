library profile;

import 'package:data_clevers/blocs/blocs.dart';
import 'package:data_clevers/config/config.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';
import '../widgets/widgets.dart';


part 'profile/about.dart';
part 'profile/certification.dart';
part 'profile/competences.dart';
part 'profile/education.dart';
part 'profile/experience.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}
  List<WorkExperience> experiences = [];
  List<Education> educations = [];

class _ProfileState extends State<Profile> {
  List<Widget> tabItems = [
    const AboutProfile(),
    const ExperienceProfile(),
    const EducationProfile(),
    const CertificationProfile(),
    const CompetenceProfile()
  ];

  Widget get tabpage => AnimatedContainer(
    decoration: BoxDecoration(
      color: Colors.transparent,
    ),
      duration: Duration(milliseconds: 200), child: tabItems[_selectedIndex]);

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: height,
        width: width,
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
            child: Column(
          children: [
            BlocBuilder<GlobalsCubit, GlobalsState>(builder: (context, state) {
              return Container(
                width: width,
                padding: EdgeInsets.symmetric(
                    horizontal: width < 800 ? 0 : (width - 800) / 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        hoverColor: AppColors.col1.withOpacity(0.4),
                        onTap: () => Navigator.canPop(context)
                            ? Navigator.pop(context)
                            : Navigator.pushNamed(context, '/home',
                                arguments: {'origin': 'profile'}),
                        child: Row(
                          children: [
                            const Icon(Icons.arrow_back_outlined),
                            Text(AppStrings.back[state.lang]!)
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child:
                            Text(AppStrings.completeyourProfile[state.lang]!)),
                  ],
                ),
              );
            }),
            const Divider(thickness: 5, color: Colors.transparent),
            Container(
              width: 800,
              alignment: Alignment.center,
              child: Column(children: [
                Container(
                  child: tabBar(),
                ),
                const SizedBox(height: 10),
                tabpage
              ]),
            )
          ],
        )),
      ),
    );
  }

  Widget tabBar() {
    return FlashyTabBar(
      animationCurve: Curves.linear,
      selectedIndex: _selectedIndex,
      showElevation: false, // use this to remove appBar's elevation
      onItemSelected: (index) => setState(() {
        _selectedIndex = index;
      }),
      items: [
        FlashyTabBarItem(
          icon: const Icon(Icons.event),
          title: const Text(
            'About Me',
            style: TextStyle(color: Colors.blue),
          ),
        ),
        FlashyTabBarItem(
          icon: const Icon(Icons.work_history),
          title: const Text(
            'My Work Experiences',
            style: TextStyle(color: Colors.blue),
          ),
        ),
        FlashyTabBarItem(
          icon: const Icon(Icons.school_outlined),
          title: const Text(
            'My Education',
            style: TextStyle(color: Colors.blue),
          ),
        ),
        FlashyTabBarItem(
          icon: const Icon(Icons.settings),
          title: const Text(
            'My Certifications',
            style: TextStyle(color: Colors.blue),
          ),
        ),
        FlashyTabBarItem(
          icon: const Icon(Icons.bar_chart_outlined),
          title: const Text(
            'My Capacities',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
