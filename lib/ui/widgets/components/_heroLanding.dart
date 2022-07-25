part of ui.widgets;

Widget ghuhdjdasn() {
  return Center();
}

Widget herolanding(BuildContext context, {title, text, nbCours}) {
  double largeur = MediaQuery.of(context).size.width * 0.8;
  double longueur = MediaQuery.of(context).size.height;
  return Center(
    child: Container(
      width: largeur,
      height: 250,
      decoration: const BoxDecoration(
        color: Color(0xFF5FB3D4),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: [
              SizedBox(
                height: longueur * 0.02,
              ),
              Positioned(
                child: Container(
                  child: Text(
                    nbCours,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff004562),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Diagonal(
                axis: Axis.vertical,
                position: DiagonalPosition.TOP_RIGHT,
                clipHeight: largeur * 0.012,
                child: Container(
                  padding: EdgeInsets.only(top: largeur * 0.006),
                  color: const Color(0xff004562),
                  height: largeur * 0.044,
                  width: largeur * 0.44,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: largeur * 0.022,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: longueur * 0.015,
              ),
              Container(
                height: 100,
                width: 300,
                child: Positioned(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: const Color(0xff004562),
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Diagonal(
            clipHeight: largeur * 0.1,
            axis: Axis.vertical,
            position: DiagonalPosition.BOTTOM_LEFT,
            child: GestureDetector(
              child: Container(
                color: const Color.fromARGB(255, 0, 69, 98),
                width: largeur * 0.4,
                height: 400.0,
                child: Container(
                  margin: const EdgeInsets.only(top: 70),
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            CircleAvatar(
                              backgroundColor: Color(0xff5FB3D4),
                            ),
                            CircleAvatar(
                              backgroundColor: Color(0xffD9D9D9),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            //les fleches

                            Container(
                              height: 52,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundColor: const Color(0xffD9D9D9),
                            ),
                            CircleAvatar(
                              backgroundColor: const Color(0xff5FB3D4),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
