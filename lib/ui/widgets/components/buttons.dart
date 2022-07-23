part of ui.widgets;

const kBue = Color.fromARGB(255, 0, 69, 98);

Widget btn1() {
  return Container(
    // width: 300,
    margin: const EdgeInsets.only(top: 10.0),
    color: AppColors.col3,
    // height: 42,
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
    width: 300,
    margin: const EdgeInsets.only(top: 10.0),
    color: AppColors.col3,
    height: 42,
    child: TextButton(
      onPressed: () => {},
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

Widget boxSection({title, description, teacher, domain, imagePath}) => Container(
  width: 400,
  height: 445,
  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    gradient:  LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.col2.withOpacity(0.5),
        AppColors.col3.withOpacity(0.3),
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
          title,
          style: const TextStyle(
            color: const Color.fromARGB(255, 0, 69, 98),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const SizedBox(height: 20),
      Container(
        padding: const EdgeInsets.symmetric(horizontal:25, vertical: 25),
        child:  Text(
          description,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w100,
          ),
        ),
      ),
      const SizedBox(height: 40),
      Container(
        height: 2,
        color: const Color.fromARGB(75, 208, 213, 217),
      ),
      const SizedBox(height: 20),
      Container(
        padding: const EdgeInsets.symmetric(horizontal:25),
        child: Row(
          children: [
             CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  imagePath            )),
            const  SizedBox(width: 5,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                 Text(
                  teacher,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 Text(domain,
                    style: const TextStyle(
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
