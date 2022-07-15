import 'package:flutter/material.dart';

const kBue = Color.fromARGB(255, 0, 69, 98);

Widget btn1() {
  return Container(
    width: 300,
    margin: const EdgeInsets.only(top: 10.0),
    color: const Color(0xFFFFFFFF),
    height: 42,
    child: ElevatedButton(
      onPressed: () => {
        // print("object"),
      },
      style: TextButton.styleFrom(
        primary: const Color.fromRGBO(255, 255, 255, 1),
        padding: const EdgeInsets.all(20),
        backgroundColor: kBue,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100))),
      ),
      child: const Text(
        "Aprendre",
        style: TextStyle(fontFamily: 'Ubuntu'),
      ),
    ),
  );
}

Widget btn2() {
  return Container(
    // decoration: BoxDecoration(
    //   borderRadius: BorderRadius.circular(30)
    // ),
    width: 300,
    margin: const EdgeInsets.only(top: 10.0),
    color: const Color(0xFFFFFFFF),
    height: 42,
    child: TextButton(
      onPressed: () => {
        // print("object"),
      },
      style: TextButton.styleFrom(
        primary: const Color.fromRGBO(255, 255, 255, 1),
        padding: const EdgeInsets.all(20),
        backgroundColor: kBue,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100))),
      ),
      child: const Text(
        "Rechercher",
        style: TextStyle(fontFamily: 'Ubuntu'),
      ),
    ),
  );
}

class FildButton extends StatefulWidget {
  const FildButton({Key? key}) : super(key: key);

  @override
  State<FildButton> createState() => _FildButtonState();
}

class _FildButtonState extends State<FildButton> {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        margin: const EdgeInsets.symmetric(horizontal: 3.3),
        height: 40,
        width: 250,
        child: TextFormField(
            decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          hintText: 'Enter a search term',
        )),
      ),
    ]);
  }
}

Widget centered() {
  return Center(
    child: TextFormField(
        decoration: const InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      hintText: 'Enter a search term',
    )),
  );
}

Widget boxSection({title}) => Container(
  width: 400,
  height: 445,
  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    gradient: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        const Color.fromARGB(255, 255, 255, 255),
        const Color.fromARGB(255, 255, 255, 255),
      ],
    ),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Icon(Icons.circle, color: Color.fromARGB(255, 0, 69, 98), size: 100),
      const SizedBox(height: 40),
      Container(
        padding: const EdgeInsets.symmetric(horizontal:25, vertical: 25),
        child: Text(
          'Introduction à phython',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 69, 98),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const SizedBox(height: 20),
      Container(
        padding: const EdgeInsets.symmetric(horizontal:25, vertical: 25),
        child: const Text(
          'Python est le langage de programmation de prédilection de référence, je dirais même préféré des Data Scientists',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w100,
          ),
        ),
      ),
      const SizedBox(height: 40),
      Container(
        width: double.infinity,
        height: 2,
        color: const Color.fromARGB(75, 208, 213, 217),
      ),
      const SizedBox(height: 20),
      Container(
        width: 300,
        padding: const EdgeInsets.symmetric(horizontal:25),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                  'https://th.bing.com/th/id/R.2b21b9dd05c757fe30231fac65b504dd?rik=HRvrrAzjR7ek%2fg&pid=ImgRaw&r=0&sres=1&sresct=1'),
            ),
            const  SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  'PERIVOU Agoula',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text('Data Scientist',
                    style: TextStyle(
                      fontSize: 15,
                    )),
              ],
            ),
          ],
        ),
      ),
    ],
  ),
);
