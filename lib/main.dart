import 'package:flutter/material.dart';
import 'ui/ui.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Route getRoutes(RouteSettings settings) {
    var name = settings.name == '/' ? '/home' : settings.name;

    switch (name) {
      case '/home':
        //TODO
        /* 
    --> on pourrait extraire le nom de l'utilisateur ici et  l'ajouter à la routeName
          pour faire genre : dataclever.com/pacomekfp/home, dataclever.com/pacomekfp/profil ... 
    --> on rajouttera une condition ici(liée au statut d'authenticaation) 
          en fonction duque on envera soit vers home soit vers login-register ! 
        */
        return MaterialPageRoute(
            builder: (_) => UserHome(key: UniqueKey()),
            settings: RouteSettings(
                arguments: settings.arguments as Map<String, dynamic>?,
                name: name));
      case '/login':
        return MaterialPageRoute(
            builder: (_) => AuthenticationPage(key: UniqueKey()),
            settings: RouteSettings(
                arguments: settings.arguments as Map<String, dynamic>?,
                name: name));
      default:
        return MaterialPageRoute(
            builder: (_) => const Page404(
                  key: Key('notFound'),
                ),
            settings: RouteSettings(
                arguments: settings.arguments as Map<String, dynamic>?,
                name: name));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Ubuntu', primaryColor: Colors.green),
      onGenerateRoute: getRoutes,
      title: 'Data Clevers',
    );
  }
}
