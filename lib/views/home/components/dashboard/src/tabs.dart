part of home.components;

class TrainingTabs extends StatelessWidget {
  const TrainingTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 32),
      child: BlocBuilder<TabToggleBloc, TabToggleState>(
        builder: (context, state) {
          TabToggleInitialState state_ = state as TabToggleInitialState;
          return Row(
            children: [
              for (TrainingTabIndex tabValue in TrainingTabIndex.values)
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () =>
                        context.read<TabToggleBloc>().add(ChangeTab(tabValue)),
                    splashColor: tabValue.color,
                    hoverColor:state_.tabIndex == tabValue ? null: tabValue.color.withOpacity(0.8),
                    child:    Container(
                      margin:const EdgeInsets.symmetric(horizontal:5),
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                      decoration: BoxDecoration(
                        color: state_.tabIndex == tabValue
                              ? AppColors.darkBlue
                              : null,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: state_.tabIndex == tabValue
                              ? AppColors.darkBlue
                              : tabValue.color,
                        ),
                      ),
                      child: Text(
                          tabValue.label,
                          style: GoogleFonts.quicksand(
                            fontSize: state_.tabIndex == tabValue ? 14 : 13.5,
                            color: state.tabIndex == tabValue
                                ? AppColors.softBlue
                                : AppColors.darkBlue,
                            fontWeight: state_.tabIndex == tabValue
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
