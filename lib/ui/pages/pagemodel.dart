import 'package:data_clevers/config/config.dart';
import 'package:data_clevers/ui/pages/getStarted.dart';
import 'package:data_clevers/ui/pages/profile.dart';
import 'package:data_clevers/ui/ui.dart';
import 'package:data_clevers/ui/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sidebarx/sidebarx.dart';

import 'dart:js' as js;

class ScaffoldGetter extends StatelessWidget {
  final int index;
  final _key = GlobalKey<ScaffoldState>();

  ScaffoldGetter({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller =
        SidebarXController(selectedIndex: index, extended: true);

    if (index == -1) {
      Navigator.pushNamed(context, '/pageNotFound');
    }
    return Builder(
      builder: (context) {
        final isSmallScreen = MediaQuery.of(context).size.width < 600;
        return Scaffold(
          key: _key,
          drawer: ExampleSidebarX(controller: _controller),
          floatingActionButton: isSmallScreen
              ? FloatingActionButton(
                  onPressed: () {
                    _controller.setExtended(true);
                    _key.currentState?.openDrawer();
                  },
                  child: const FaIcon(FontAwesomeIcons.bars),
                )
              : null,
          body: Row(
            children: [
              if (!isSmallScreen) ExampleSidebarX(controller: _controller),
              Expanded(
                child: Center(
                  child: PageModel(controller: _controller),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget getPage(SidebarXController _controller, context) {
  if (_controller.selectedIndex == -1)
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => Page404(),
            settings: RouteSettings(arguments: {'origin': 'login'})));
  switch (_controller.selectedIndex) {
    case 0:
      return const UserHome();
    case 1: //consulter son profile
      return const Course();
    case 2: //presenter le cours
      return const Profile();

    default:
      return Builder(builder: (context) {
        Navigator.pushNamed(context, '/pageNotFound');
        return Wrap();
      });
  }
}

class PageModel extends StatelessWidget {
  final SidebarXController controller;
  PageModel({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Column(
          children: [
            getPage(controller, context),
          ],
        );
      },
    );
  }
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/images/avatar.png'),
          ),
        );
      },
      items: [
        SidebarXItem(
            icon: Icons.home,
            label: 'Home',
            onTap: () => Navigator.pushNamed(context, '/home')),
        SidebarXItem(
            icon: Icons.school,
            label: 'My Courses',
            onTap: () => Navigator.pushNamed(context, '/course')),
        SidebarXItem(
            icon: Icons.settings,
            label: 'My profile',
            onTap: () => Navigator.pushNamed(context, '/profile')),
        SidebarXItem(
            icon: Icons.logout,
            label: 'Logout',
            onTap: () {
              Navigator.pushNamed(context, '/login');
            }),
        SidebarXItem(
            iconWidget: AppLogo(size: AppLogoSize.smallest),
            label: 'DataClevers',
            onTap: () => js.context.callMethod(
                'open', ['https://elearning-dataclevers.web.app/'])),
      ],
    );
  }
}

const primaryColor = Color.fromARGB(255, 60, 174, 250);
const canvasColor = Color.fromARGB(255, 86, 188, 255);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color.fromARGB(255, 62, 92, 97);
const white = Colors.white;
final actionColor = const Color.fromARGB(255, 95, 156, 167).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);


/*showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('logout Confiration'),
                    content: const Text(
                        'Do you really want to logout your account ?\nNote: Your current progression will be saved !'),
                    actions: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Text('No, stay '),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.redAccent)),
                        onPressed: () {
                          makeToast(
                              msg: 'You have been succesfull logged out !',
                              context: context,
                              type: 'info');
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text('Yes, logout'),
                      )
                    ],
                  );
                }

                */