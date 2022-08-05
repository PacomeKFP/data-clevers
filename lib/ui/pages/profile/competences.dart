part of profile;

class CompetenceProfile extends StatefulWidget {
  const CompetenceProfile({Key? key}) : super(key: key);

  @override
  State<CompetenceProfile> createState() => _CompetenceProfileState();
}

class _CompetenceProfileState extends State<CompetenceProfile> {
  _addExperience(list) {
    setState(() {
      competences.add(Competence(
          title: list[0],
          domain: list[1],
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    List<FormularField> fields = [
      FormularField(
          label: 'Title',
          hintText: 'Your role in this experience',
          isRequired: true),
      FormularField(
          label: 'Employer',
          hintText: 'In which structure was you ?',
          isRequired: true),
    ];
    Formular form = Formular(
      formKey: formKey,
      title: 'Tell us about your competences',
      libelle:
          'Complete following fields to add new competences on your profile, you will be able to modify it later !',
      fields: fields,
      callback: (list) => _addExperience(list),
    );
    AlertDialog popUpFormular = AlertDialog(
      backgroundColor:Colors.white,
      content: SingleChildScrollView(child: form),
      contentPadding: EdgeInsets.zero,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:const  Icon(Icons.cancel_presentation_rounded))
      ],
    );

    return SizedBox(
        child: Column(children: [
      Column(
          children: competences.isEmpty
              ? [const Text("No Competences yet added")]
              : List.generate(competences.length, (index) => competences[index])
                  .toList()),
      const SizedBox(height: 5),
      AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: OutlinedButton.icon(
            onPressed: () => showDialog(
                context: context,
                builder: (context) => popUpFormular,
                routeSettings: RouteSettings(
                    name:
                        '${ModalRoute.of(context)!.settings.name}/addCompetences')),
            icon: const Icon(Icons.add),
            label: const Text('Add a new skill')),
      )
    ]));
  }
}
