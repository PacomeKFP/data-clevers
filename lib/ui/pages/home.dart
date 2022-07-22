part of ui;

class UserHome extends StatelessWidget {
  const UserHome({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffolder().getScaffold(
      context: context,
      Home: Container(
        width: width*0.8,
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  SizedBox(height: 50, width: width * 0.6),
                  herolanding(context),
                  SizedBox(height: 50, width: width * 0.6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "105 Cours",
                        style: TextStyle(color: AppColors.col1, fontSize: 24),
                      ),
                      FildButton()
                    ],
                  ),
                  SizedBox(height: 50, width: width * 0.6),
                  Row(
                    children: [
                      boxSection(
                          title: 'Introduction à phython',
                          description:
                              'Python est le langage de programmation de prédilection de référence,' 
                              'je dirais même préféré des Data Scientists',
                          teacher: 'PERIVOU Agoula',
                          domain: 'Data Scientist', imagePath: '../../../assets/images/avatar.png')
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    width: width,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
