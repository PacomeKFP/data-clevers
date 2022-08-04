import 'package:data_clevers/blocs/globals/globals_cubit.dart';
import 'package:data_clevers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:data_clevers/config/config.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Page3Affiche(title: 'Flutter Demo Home Page'),
    );
  }
}

class Page3Affiche extends StatefulWidget {
  const Page3Affiche({super.key, required this.title});

  final String title;

  @override
  State<Page3Affiche> createState() => _Page3AfficheState();
}


class _Page3AfficheState extends State<Page3Affiche> {
  @override
  Widget build(BuildContext context) {
    double largeur = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: const Color.fromARGB(230, 224, 223, 223),
        child: Row(
          children: <Widget>[
            Column(
              children: [
                Expanded(
                  child: Container(
                    width: largeur * 0.3,
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    padding: const EdgeInsets.fromLTRB(40, 40, 50, 70),
                    decoration: const BoxDecoration(color: Color(0xff004562)),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      height: 160,
                      width: largeur * 0.65,
                      margin: const EdgeInsets.fromLTRB(4, 8, 8, 4),
                      padding: const EdgeInsets.fromLTRB(15, 60, 2, 0),
                      decoration: const BoxDecoration(color: Color(0xff004562)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                'Introduction à Python',
                                style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                // style: const ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green),),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0xffCBEAC3)),
                                ),
                                onPressed: (() {}),
                                child: const Text(
                                  'Commencer',
                                  style: TextStyle(
                                    color: Color(0xff004562),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Ubuntu',
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(25, 8, 25, 4),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Text(
                                    'Description du Cours',
                                    style: TextStyle(
                                      color: Color(0xff004562),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Ubuntu',
                                    ),
                                  ),
                                  Text(
                                    "Python est le langage de programmation de prédilection de référence, je dirais même préféré"
                                    "des Data Scientists. En effet, Python est connu pour sa simplicité du point de la syntaxe. Python"
                                    "possède également une communauté active et un vaste choix de bibliothèques et de ressources qui"
                                    "permettent d’effectuer des taches de Data Science sans tracas."
                                    "",
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                    ),
                                  ),
                                  Text(
                                    'Description du Cours',
                                    style: TextStyle(
                                      color: Color(0xff004562),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Ubuntu',
                                    ),
                                  ),
                                  Text(
                                    "Ce cours à deux grand objectifs, celui de vous donner les fondamentaux sur la programmation"
                                    "python ; et de vous introduire les deux plus grandes bibliothèques dans la manipulation des tableaux"
                                    "et des données : Numpy et Pandas.",
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                            color: const Color(0xffFFFEFE),
                            // color: Colors.black,
                            height: 180,
                            width: largeur * 0.18,
                          ),
                        ],
                      ),
                    ),
                  
                  
                  ],
                ),
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
