part of home.components;

class TrainingTabs extends StatelessWidget {
  const TrainingTabs({Key? key})
      : super(key: key);

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
                InkWell(
                  onTap: () => context.read<TabToggleBloc>().add(ChangeTab(tabValue)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Chip(
                      label: Text(
                        tabValue.label,
                        style: GoogleFonts.quicksand(
                          fontSize: state_.tabIndex == tabValue ? 13 : 12,
                          color: state.tabIndex == tabValue
                              ? AppColors.softBlue
                              : AppColors.darkBlue,
                          fontWeight: state_.tabIndex == tabValue
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      backgroundColor: state_.tabIndex == tabValue
                          ? AppColors.darkBlue
                          : AppColors.softBlue,
                      side: BorderSide(
                        color: state_.tabIndex == tabValue
                            ? AppColors.darkBlue
                            : tabValue.color,
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
