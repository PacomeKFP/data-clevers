part of profile;

class AboutProfile extends StatelessWidget {
  const AboutProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Formular(
        autoValidate: true,
        title: 'About You',
        libelle:
            "Let's more about you to be able to give you the best content adapted to you !",
        callback: (list) => list.forEach((element) => print(element)),
        fields: [
          FormularField(
              label: 'Your name',
              hintText: 'Enter your name here',
              isRequired: true),
          FormularField(
              label: 'Your surname', hintText: 'Enter your surname here'),
          FormularField(
              label: 'Your user name',
              hintText: 'Enter your user name here',
              isRequired: true),
          FormularField(
              label: 'Your email',
              hintText: 'Enter your name here',
              isRequired: true),
          FormularField(
              label: 'Your biography',
              hintText: 'Tell us more about you',
              isLongText: true),
          //on mettra les langues et les centress d'interets ici
        ],
        // footer: [
        //   OutlinedButton(
        //       onPressed: () => makeToast(
        //           msg: 'you want to change your password',
        //           context: context,
        //           type: 'debug'),
        //       child: Text('Change Password'))
        // ],
      ),
    ]);
  
  
  }
}
