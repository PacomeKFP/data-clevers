
import 'package:data_clevers/blocs/blocs.dart';
import 'package:data_clevers/ui/pages/getStarted.dart';
import 'package:data_clevers/ui/pages/page.dart';
import 'package:data_clevers/ui/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ui/ui.dart';
import 'ui/widgets/widgets.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()),
      blocObserver: GlobalsBlocObserver());
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

      case '/getStarted':
        return MaterialPageRoute(
            builder: (_) => GetStarted(key: UniqueKey()),
            settings: RouteSettings(
                arguments: settings.arguments as Map<String, dynamic>?,
                name: name));
                break;
      case '/profile':
        return MaterialPageRoute(
            builder: (_) => Profile(key: UniqueKey()),
            settings: RouteSettings(
                arguments: settings.arguments as Map<String, dynamic>?,
                name: name));
                break;
      case '/sidebar':
        return MaterialPageRoute(
            builder: (_) => SidebarXExampleApp(key: UniqueKey()),
            settings: RouteSettings(
                arguments: settings.arguments as Map<String, dynamic>?,
                name: name));
                break;


      default:
        //Cas ou on peut etre dans un deep link
        if (Uri.parse(settings.name!).pathSegments.length == 2) {
          print('lenght 2');
          //deep linking test01
          Map<String, dynamic> args = {};
             if(settings.arguments != null)
              args.addAll(settings.arguments as Map<String, dynamic>);
              
          if (Uri.parse(settings.name!).pathSegments[0] == 'course') {
            args.addAll({'cours_id': Uri.parse(settings.name!).pathSegments[1].toString()});
          print("lenght ${args['cours_id']}");
            return MaterialPageRoute(
              
                builder: (_) => Course(
                    key: Key(
                        Uri.parse(settings.name!).pathSegments[1].toString())),
                settings: RouteSettings(
                    arguments:args,
                    name: name));
                    break;
          }
        }

        return MaterialPageRoute(
            builder: (_) => const Page404(key: Key('notFound')),
            settings: RouteSettings(
                arguments: settings.arguments as Map<String, dynamic>?,
                name: name));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GlobalsCubit(),
        child: BlocBuilder<GlobalsCubit, GlobalsState>(
          builder: (context, state) {
            // context.read<GlobalsCubit>().init();
            return MaterialApp(
              
              initialRoute: '/home',
              theme: ThemeData(
                  fontFamily: 'Ubuntu',
                  primaryColor: Colors.green,
                  brightness: state.theme),
              onGenerateRoute: getRoutes,
              title: 'Data Clevers',
            );
          },
        ));
  }
}
