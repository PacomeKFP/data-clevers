import 'package:data_clevers/config/config.dart';
import 'package:data_clevers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.col4,
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          SidemenuItem(title: 'My Progress', icon: Icons.home, routeName: '/'),
          SidemenuItem(
              title: 'My Bookmarks', icon: Icons.shopping_cart, routeName: '/'),
          SidemenuItem(
              title: 'Leaderboard', icon: Icons.border_color, routeName: '/'),
          const SizedBox(height: 10),
          const Text("CATALOG"),
          const SizedBox(height: 3),
          SidemenuItem(
              title: 'Competitions', icon: Icons.exit_to_app, routeName: '/'),
          SidemenuItem(
              title: 'Courses', icon: Icons.school_outlined, routeName: '/'),
          SidemenuItem(
              title: 'Projects',
              icon: Icons.content_paste_go_sharp,
              routeName: '/'),
          SidemenuItem(
              title: 'Donate',
              icon: Icons.local_activity_outlined,
              routeName: '/'),
        ],
      ),
    );
  }
}

class SidemenuItem extends StatefulWidget {
  final String title;
  final IconData icon;
  final String routeName;
  SidemenuItem(
      {Key? key,
      required this.title,
      required this.icon,
      required this.routeName})
      : super(key: key);

  @override
  State<SidemenuItem> createState() => _SidemenuItemState();
}

class _SidemenuItemState extends State<SidemenuItem> {
  bool isHover = false;

  Entered(bool e) {
    setState(() {
      isHover = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()
      ..translate(20, 20, 5)
      ..scale(1.1);
    final transform = isHover ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
      onEnter: Entered(true),
      onExit: Entered(false),
      child: InkWell(
        onTap: ()=>makeToast(context: context, msg: 'Yo', type: 'debug'),
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(vertical: 5),
          duration: const Duration(milliseconds: 200),
          curve: Sprung.overDamped,
          transform: transform,
          decoration: isHover
              ? BoxDecoration(
                  color:
                      isHover ? AppColors.col4.withBlue(200) : Colors.transparent,
                  border: Border.all(color: AppColors.blue_blak),
                  borderRadius: const BorderRadius.all(Radius.circular(8)))
              : null,
          child: ListTile(
            leading: Icon(widget.icon),
            title: Text(widget.title),
            onTap: () => {},
          ),
        ),
      ),
    );
  }
}
