part of ui;

class AuthenticationPage extends StatelessWidget {
  
   const AuthenticationPage({Key? key} ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              MediaQuery.of(context).size.width > 600 ?
                LeftSidePage() : Wrap(),
                LoginForm()
            ]
          ),
        )
      )
    );
  }
}

class LoginForm extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double espaceentre = 25;
    double Largeur = MediaQuery.of(context).size.width;

    return             Container(
              width: Largeur * 0.5,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 60),
              child: Column(
                children: [
                   SizedBox(
                    height: espaceentre,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                          //Text('Have an Account ?'),
                          child: RichText(
                        text: const TextSpan(
                            text: 'Have an Account ?',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Ubuntu',
                                fontSize: 18),
                            children: <TextSpan>[
                              TextSpan(
                                text: '  Log in',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontFamily: 'Ubuntu',
                                    fontSize: 18),

                                // recognizer:  TapGestureRecognizer()
                                //     ..onTap=() {          //     }
                              ),
                            ]),
                      )),
                      const Icon(
                        Icons.arrow_right_alt_sharp,
                        size: 25,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Container(
                    child: const Text(
                      'Creat your Account.',
                      style: TextStyle(fontSize: 20, fontFamily: 'Ubuntu'),
                    ),
                  ),
                   SizedBox(
                    height: espaceentre,
                  ),
                  Container(
                    height: 2,
                    width: Largeur * 0.3,
                    color: const Color.fromARGB(255, 153, 149, 149),
                  ),
                   SizedBox(
                    height: espaceentre,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.rectangle,
                        size: 25,
                        color: Color.fromARGB(255, 82, 79, 79),
                      ),
                      SizedBox(
                          //Text('Have an Account ?'),
                          child: RichText(
                        text: const TextSpan(
                            text: 'I agree to DataClavers\'s ',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Ubuntu',
                                fontSize: 18),
                            children: <TextSpan>[
                              TextSpan(
                                text: """ Master Services Agreement"""
                                    """ \n""",
                                style: TextStyle(
                                    color: Color.fromRGBO(33, 150, 243, 1),
                                    fontFamily: 'Ubuntu',
                                    fontSize: 18),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' and acknowledge  DataClevers\'',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Ubuntu',
                                        fontSize: 18),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' Privacy Policy.',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  33, 150, 243, 1),
                                              fontFamily: 'Ubuntu',
                                              fontSize: 18)),
                                    ],
                                  ),
                                ],
                              ),
                            ]),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: 400,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(70)),
                    child: Row(children: <Widget>[
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset(
                                '../assets/images/google.png',
                                height: 34,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // margin: EdgeInsets.all(5),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 30),
                          child: const Text(
                            "SIGN UP WHIT GOOGLE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                   SizedBox(
                    height: espaceentre,
                  ),
                  Container(
                    width: 400,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(70)),
                    child: Row(children: <Widget>[
                      Container(
                        color: const Color.fromARGB(255, 32, 31, 31),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset(
                                '../assets/images/github.png',
                                height: 34,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // margin: EdgeInsets.all(5),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 30),
                          child: const Text(
                            "SIGN UP WHIT Github",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                   SizedBox(
                    height: espaceentre,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    width: 400,
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 110, 109, 109),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(
                          Icons.mail,
                          size: 25,
                        ),
                         InkWell(
                          onTap: ()=>Navigator.pushNamed(context, '/getStarted'),
                           child:const Text(
                            '  Mail',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Ubuntu',
                                color: Color.fromARGB(190, 0, 0, 0)),
                        ),
                         )
                      ],
                    ),
                  ),
                   SizedBox(
                    height: espaceentre,
                  ),
                ],
              ),
            );
  }
}

class LeftSidePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  double Largeur = MediaQuery.of(context).size.width;
double espaceentre = 25;
    return             Column(
              children: [
                Container(
                  //Right Widget
                  width: Largeur * 0.5,
                  padding: const EdgeInsets.fromLTRB(50, 80, 50, 80),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF5FB3D4),
                      Color(0xFF024764),
                    ],
                  )),
                  child: Column(
                    children: [
                       SizedBox(
                        height: espaceentre,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.check_box,
                            size: 30,
                            color: Color.fromARGB(255, 58, 56, 56),
                          ),
                          Container(
                            child: const Text(
                              'The African referential in Data Analysis.',
                              style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 25,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                       SizedBox(
                        height: espaceentre,
                      ),
                      const SizedBox(
                        child: Text(
                          'Follow our advanced Data Science training program on  Data Engineering, Data Analysis, Machine Learning, Data Product Owner, Data IA Developer and Data Mining modules',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 18,
                              color: Colors.black),
                        ),
                      ),
                       SizedBox(
                        height: espaceentre,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.check_box,
                            size: 30,
                            color: Color.fromARGB(255, 58, 56, 56),
                          ),
                          const SizedBox(
                            child: Text(
                              'Data Type Coverage',
                              style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 25,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                       SizedBox(
                        height: espaceentre,
                      ),
                      const SizedBox(
                        child: Text(
                            'We help companies label image, text, audio, video, and '
                            'lidar data with use cases like NER to Audio'
                            'Transcription to Video Polygon Annotation to Image '
                            'Annotation to 3D Point Cloud Annotation.',
                            style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 18,
                                color: Colors.black)),
                      ),
                       SizedBox(
                        height: espaceentre,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.check_box,
                            size: 30,
                            color: Color.fromARGB(255, 58, 56, 56),
                          ),
                          const SizedBox(
                            child: Text(
                              'Receive labels quickly',
                              style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 25,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                       SizedBox(
                        height: espaceentre,
                      ),
                      const SizedBox(
                        child: Text(
                            'Receive quality labels in a matter of hours from DataClevers’s '
                            'taskers across multiple time zones using our turnkey solution.',
                            style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 18,
                                color: Colors.black)),
                      ),
                    ],
                  ),
                ),
              ],
            );
            
  }

}

