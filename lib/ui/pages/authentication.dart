part of ui;

class AuthenticationPage extends StatelessWidget {
   const AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffolder().getScaffold(
      context: context,
        Home: Center(
      child: Column(
        children: [
          const Text("Registration"),
          const SizedBox(height: 20),
          OutlinedButton(onPressed: ()=>Navigator.pushNamed(context, '/home'), child: const Text('Push'))
        ],
      ),
    ));
  }
}

