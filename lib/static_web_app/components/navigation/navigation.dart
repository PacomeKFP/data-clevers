part of side_navigation.components;

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  final ScrollController _scrollController = ScrollController();
  bool _isCollapsed = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: Duration(milliseconds: 475),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      alignment: Alignment.centerLeft,
      height: size.height,
      width: _isCollapsed ? 100 : 175,
      decoration: BoxDecoration(
          color: AppColors.darkBlue,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: CompanyName(isCollapsed : _isCollapsed),
            ),
            Align(
              alignment: Alignment.center,
              child: NavBar(
                isCollapsed: _isCollapsed,
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: NavBarItem(
                    isCollapsed: _isCollapsed,
                    label: "LogOut",
                    icon: Feather.log_out,
                    touched: () => print('Logout'),
                    isActive: false)),
            IconButton(
                onPressed: () => setState(() {
                      _isCollapsed = !_isCollapsed;
                    }),
                icon: Icon(_isCollapsed
                    ? Feather.arrow_right
                    : Feather.arrow_left))
          ],
        ),
      ),
    );
  }
}
