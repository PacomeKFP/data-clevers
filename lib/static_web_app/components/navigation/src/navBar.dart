part of side_navigation.components;

class NavBar extends StatefulWidget {
  const NavBar({Key? key, required this.isCollapsed}) : super(key: key);

  final bool isCollapsed;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<bool> selected = [true, false, false, false];

  void _select(int index) {
    for (var i = 0; i < selected.length; i++) {
      setState(() {
        if (i == index) {
          selected[i] = true;
        } else {
          selected[i] = false;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          NavBarItem(
              isCollapsed: widget.isCollapsed,
              label: "Dashboard",
              icon: Feather.home,
              touched: () => _select(0),
              isActive: selected[0]),
          NavBarItem(
              isCollapsed: widget.isCollapsed,
              label: "Folders",
              icon: Feather.folder,
              touched: () => _select(1),
              isActive: selected[1]),
          NavBarItem(
              isCollapsed: widget.isCollapsed,
              label: "Messages",
              icon: Feather.message_square,
              touched: () => _select(2),
              isActive: selected[2]),
          NavBarItem(
              isCollapsed: widget.isCollapsed,
              label: "Settings",
              icon: Feather.settings,
              touched: () => _select(3),
              isActive: selected[3])
        ],
      ),
    );
  }
}
