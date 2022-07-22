part of ui;



class Page404 extends StatelessWidget {
  const Page404({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 5), (() {
        Navigator.pushNamed(context, '/home', arguments:{'origin': '404'});
      }));

      makeToast(
          msg: "Vous serez redirigé sous peu ...",
          context: context,
          type: 'info');
    });

    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 175, 193, 202),
      body: Center(child: Text("404 | Page Not Found")),
    );
  }
}
