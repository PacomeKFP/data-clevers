import 'package:aptitudes/views/auth/app.dart';
import 'package:aptitudes/views/offline/offline.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'blocs/blocs.dart';

import 'views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyCkApbJ3e_K8oFAg1-o-iS8gIdNhFOVPzY',
        appId: '1:509724216292:web:2704757d000654b0b715f1',
        messagingSenderId: '509724216292',
        projectId: 'dataclevers01',
        authDomain: 'dataclevers01.firebaseapp.com',
        storageBucket: 'dataclevers01.appspot.com',
        measurementId: 'G-KZL43B5EBH',
        iosClientId:
            '509724216292-arhls46m4vp7mm4av2nlra4r2g425cnm.apps.googleusercontent.com',
        iosBundleId: 'com.example.aptitudes',
      )).then((value) => runApp(const MyApp()));
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(create: (context) => AuthenticationBloc()),
        BlocProvider<TabToggleBloc>(create: (context) => TabToggleBloc()),
        BlocProvider<SideNavigationBloc>(
            create: (context) => SideNavigationBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DataClevers',
        theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
          fontFamily: GoogleFonts.roboto().fontFamily,
          primarySwatch: Colors.blue,
        ),
        home:  OutHomePage(),
      ),
    );
  }
}
