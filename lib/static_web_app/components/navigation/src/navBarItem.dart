part of side_navigation.components;

class NavBarItem extends StatefulWidget {
  const NavBarItem(
      {Key? key,
      required this.icon,
      required this.touched,
      required this.isActive,
      required this.label,
      required this.isCollapsed})
      : super(key: key);

  final IconData icon;
  final Function touched;
  final bool isActive;
  final String label;
  final bool isCollapsed;
  @override
  State<NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  bool isHover = false;

  void _hovered(bool e) {
    setState(() {
      isHover = e;
    });
  }

  final Duration _animationDuration = const Duration(milliseconds: 475);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onHover: (e) => _hovered(e),
        onTap: () => widget.touched(),
        splashColor: Colors.white,
        hoverColor: Colors.white12,
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        child: Row(
          children: [
            AnimatedContainer(
              padding: const EdgeInsets.symmetric(vertical: 10),
              duration: _animationDuration,
              height: 50.0,
              width: 5.0,
              decoration: BoxDecoration(
                  boxShadow: [
                    if (widget.isActive)
                      BoxShadow(
                          color: AppColors.softBlue.withOpacity(0.1),
                          offset: const Offset(3, -1),
                          blurRadius: 5)
                  ],
                  color:
                      widget.isActive ? AppColors.softBlue : Colors.transparent,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Icon(
                    widget.icon,
                    color: widget.isActive ? Colors.white : Colors.white54,
                    size: 19.0,
                  ),
                  if (!widget.isCollapsed)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: AnimatedTextKit(
                        isRepeatingAnimation: false,
                        animatedTexts: [
                          TyperAnimatedText(
                            widget.label,
                            textStyle: TextStyle(
                                fontSize: 16, color: AppColors.softBlue),
                          )
                        ],
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
