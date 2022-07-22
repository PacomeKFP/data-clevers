part of ui;

class UserHome extends StatelessWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalsCubit, GlobalsState>(
      builder: (context, state) {
        double width = MediaQuery.of(context).size.width;
        return Scaffolder().getScaffold(
          context: context,
          Home: Container(
            width: width * 0.8,
            child: ListView(
              shrinkWrap: true,
              children: [
                ButtonBar(children: [
                  ElevatedButton(
                      onPressed: () {
                        context.read<GlobalsCubit>().changeLanguage('fr');
                      },
                      child: Text(AppStrings.frLang[state.lang]!)),
                  ElevatedButton(
                      onPressed: () {
                        context.read<GlobalsCubit>().changeLanguage('en');
                      },
                      child: Text(AppStrings.enLang[state.lang]!)),
                  Switch(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      value: state.theme == Brightness.dark,
                      onChanged: (bool isDark) {
                        context.read<GlobalsCubit>().changeTheme(
                            !isDark ? Brightness.light : Brightness.dark);
                      })
                ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      SizedBox(height: 50, width: width * 0.6),
                      herolanding(context,
                          title: AppStrings.landingTitle[state.lang],
                          text: AppStrings.landingText[state.lang],
                          nbCours: AppStrings.nbCours[state.lang]),
                      SizedBox(height: 50, width: width * 0.6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '105 ${AppStrings.nbCours[state.lang]}',
                            style:
                                TextStyle(color: AppColors.col1, fontSize: 24),
                          ),
                          FildButton()
                        ],
                      ),
                      SizedBox(height: 50, width: width * 0.6),
                      Row(
                        children: [
                          boxSection(
                              title: AppStrings.titre1[state.lang],
                              description: AppStrings.description1[state.lang],
                              teacher: 'PERIVOU Agoula',
                              domain: AppStrings.domaine1[state.lang],
                              imagePath: '../../../assets/images/avatar.jpeg')
                        ],
                      ),
                      SizedBox(
                        height: 50,
                        width: width,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
