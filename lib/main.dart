import 'blocs/sideNavigation/side_navigation_bloc.dart';
import 'blocs/tabToggle/tab_toggle_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TabToggleBloc>(create: (context) => TabToggleBloc()),
        BlocProvider<SideNavigationBloc>(create: (context) => SideNavigationBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DataClevers',
        theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
          fontFamily: GoogleFonts.roboto().fontFamily,
          primarySwatch: Colors.blue,
        ),
        home: const UserHome(),
      ),
    );
  }
}
