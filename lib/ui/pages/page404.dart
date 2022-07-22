part of ui;

class Page404 extends StatelessWidget {
  const Page404({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalsCubit, GlobalsState>(
      builder: (context, state) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          // Future.delayed(const Duration(seconds: 5), (() {
          //   Navigator.pushNamed(context, '/home', arguments: {'origin': '404'});
          // }));
          makeToast(
              msg: AppStrings.toat404[state.lang]!,
              context: context,
              type: 'info');
        });
        return Scaffold(
          backgroundColor: AppColors.col2,
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppStrings.notFound[state.lang]!),
              ButtonBar(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        context.read<GlobalsCubit>().changeLanguage('fr');
                      },
                      child: Text("Francais")),
                  ElevatedButton(
                      onPressed: () {
                        context.read<GlobalsCubit>().changeLanguage('en');
                      },
                      child: Text("Anglais"))
                ],
              )
            ],
          )),
        );
      },
    );
  }
}
