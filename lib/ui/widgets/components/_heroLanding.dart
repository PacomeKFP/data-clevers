part of ui.widgets;


Widget herolanding(BuildContext context) {
    double largeur = MediaQuery.of(context).size.width * 0.8;
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
                const SizedBox(height: 40,),
                Positioned(
                  child: Container(
                    child: const Text(
                      'Cours' ,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff004562),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                Diagonal(
                  axis: Axis.vertical,
                  position: DiagonalPosition.TOP_RIGHT,
                  clipHeight: 9,
                  child: Container(
                    color: const Color(0xff004562),
                    height: 30,
                    width: 300,
                    child: const Text('Apprentissage pratique' , style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign:TextAlign.center,),
                  ),
                ),
                const SizedBox(height: 25,),

                Container(
                  height: 100,
                  width: 300,
                  child: const Positioned(
                    child: const Text('Il est temps de retrousser vos manches nous apprenons mieux en faisant. Tous nos cours interactifs',
                            style: TextStyle(color: const Color(0xff004562) , fontSize: 17,),
                    ),
                    ),
                    ),
              ],
            ),
            Diagonal(
              clipHeight: 80.0,
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const CircleAvatar(
                                backgroundColor: Color(0xff5FB3D4),
                              ),
                              const CircleAvatar(
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const CircleAvatar(
                                backgroundColor: const Color(0xffD9D9D9),
                              ),
                              const CircleAvatar(
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