part of home.components;

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SideNavigationBloc, SideNavigationState>(
      builder: (context, state) {
        SideNavigationInitial state_ = state as SideNavigationInitial;
        bool isCollapsed = state_.isCollapsed;
        double _sideWidth = isCollapsed ? 100 : 175;
        return Container(
          color: AppColors.softBlue,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 475),
                curve: Curves.decelerate,
                padding: const EdgeInsets.only(top: 2),
                alignment: Alignment.centerLeft,
                height: double.infinity,
                width: _sideWidth,
                decoration: BoxDecoration(
                  color: AppColors.darkBlue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CompanyName(isCollapsed: isCollapsed),
                    Column(
                      children: SideNavigationIndex.values
                          .map<Widget>((e) => e != SideNavigationIndex.logout
                              ? Item(index: e)
                              : const SizedBox.shrink())
                          .toList(),
                    ),
                    const Item(index: SideNavigationIndex.logout),
                  ],
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds:275),
                top:10,
                left:_sideWidth-20,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.softBlue.withOpacity(0.8)),
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.softBlue.withOpacity(0.5)),
                  child: IconButton(
                      onPressed: () =>
                          context.read<SideNavigationBloc>().add(Collapse()),
                      icon: Icon(isCollapsed
                          ? Feather.arrow_right
                          : Feather.arrow_left)),
                ),
              ), Positioned(
                left:_sideWidth+40,
                child: Container(
                  color: AppColors.softBlue,
                  child: Column(children: [])
                ),
              )
            ],
          ),
        );
        ;
      },
    );
  }
}
