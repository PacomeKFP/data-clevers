import 'package:data_clevers/blocs/blocs.dart';
import 'package:data_clevers/ui/pages/animatedLogin.dart';
import 'package:data_clevers/ui/pages/getStarted.dart';
import 'package:data_clevers/ui/pages/page.dart';
import 'package:data_clevers/ui/pages/pagemodel.dart';
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

  int getIndex(String routePath) {
    switch (routePath) {

      case '/home':
        return 0;
      case '/course':
        return 1;
      case '/profile':
        return 2;

      default:
        return -1;
    }
  }

  Route getRoutes(RouteSettings settings) {
    // var args = settings.arguments! as Map<String, dynamic>?;

    var name = settings.name == '/' ? '/home' : settings.name;
    var path = getIndex(name!) == -1 ? '/pageNotFound' : name;

    switch (name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());

        case '/logout':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/getStarted':
        return MaterialPageRoute(builder: (_) => GetStarted());
      case '/launcher':
        return MaterialPageRoute(builder: (_) => LoginScreen());  
      default:
        return MaterialPageRoute(
        builder: (_) => ScaffoldGetter(
              index: getIndex(name),
            ),
        settings: RouteSettings(name: path));
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
