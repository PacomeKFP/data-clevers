part of home.components;

class Item extends StatefulWidget {
  const Item({
    Key? key,
    required this.index,
  }) : super(key: key);
  final SideNavigationIndex index;

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  final Duration _animationDuration = const Duration(milliseconds: 475);
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<SideNavigationBloc, SideNavigationState>(
        builder: (context, state) {
          SideNavigationInitial state_ = state as SideNavigationInitial;
          bool isActive = state_.currentIndex == widget.index;
          return Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => widget.index.tapEvent(context),
              splashColor: Colors.white,
              hoverColor: Colors.white12,
              customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60)),
              child: Row(
                children: [
                  AnimatedContainer(
                    margin: EdgeInsets.only(left: 1),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    duration: _animationDuration,
                    height: 50.0,
                    width: 5.0,
                    decoration: BoxDecoration(
                        boxShadow: [
                          if (isActive)
                            BoxShadow(
                                color: AppColors.softBlue.withOpacity(0.1),
                                offset: const Offset(3, -1),
                                blurRadius: 5)
                        ],
                        color:
                            isActive ? AppColors.softBlue : Colors.transparent,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      children: [
                        Icon(
                          widget.index.icon,
                          color: isActive ? Colors.white : Colors.white54,
                          size: 19.0,
                        ),
                        if (!state_.isCollapsed)
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: AnimatedTextKit(
                              isRepeatingAnimation: false,
                              animatedTexts: [
                                TyperAnimatedText(
                                  widget.index.label,
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
        },
      );
}
