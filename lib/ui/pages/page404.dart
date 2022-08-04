part of ui;

class Page404 extends StatelessWidget {
  const Page404({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = GlobalsCubit();
    return BlocBuilder<GlobalsCubit, GlobalsState>(
      bloc: cubit,
      builder: (context, state) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Future.delayed(const Duration(seconds: 5), (() {
            cubit.close();
            Navigator.pushNamed(context, '/home', arguments: {'origin': '404'});

          }));
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
            ],
          )),
        );
      },
    );
  }
}
