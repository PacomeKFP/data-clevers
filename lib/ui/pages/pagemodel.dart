import 'package:data_clevers/config/config.dart';
import 'package:data_clevers/ui/pages/getStarted.dart';
import 'package:data_clevers/ui/pages/profile.dart';
import 'package:data_clevers/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sidebarx/sidebarx.dart';

class ScaffoldGetter extends StatelessWidget {
  final int index;
  final _key = GlobalKey<ScaffoldState>();

  

  ScaffoldGetter({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _controller = SidebarXController(selectedIndex: index, extended: true);
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

Widget getPage(SidebarXController _controller) {
  switch (_controller.selectedIndex) {
    case 0:
      return LoginForm();
    case 1:
      return const GetStarted();
    case 2:
      return const UserHome();
    // case 3:
    //     return Prunelle();

    // ici on prendra la derniere page que prunelle à faite

    case 4: //presenter le cours
      return const Course();
    case 5: //consulter son profile
      return const Profile();

    default:
      return const Page404();
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
        return getPage(controller);
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
            child: Column(
              children: [
                Image.asset('assets/images/avatar.png'),
                const Text('User Name')
              ],
            ),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Home',
          onTap: () {
            debugPrint('Home');
          },
        ),
        const SidebarXItem(
          icon: Icons.school,
          label: 'My Courses',
        ),
        const SidebarXItem(
          icon: Icons.settings,
          label: 'My profile',
        ),
        const SidebarXItem(
          icon: Icons.logout,
          label: 'Logout',
        ),
        SidebarXItem(
          iconWidget: AppLogo(),
          label: 'DataClevers',
        ),
      ],
    );
  }
}

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
