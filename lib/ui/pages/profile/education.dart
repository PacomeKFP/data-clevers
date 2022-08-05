part of profile;

class EducationProfile extends StatefulWidget {
  const EducationProfile({Key? key}) : super(key: key);

  @override
  State<EducationProfile> createState() => _EducationProfileState();
}

class _EducationProfileState extends State<EducationProfile> {
  _addEducation(list) {
    print(4);
    setState(() {
      educations.add(Education(
        diplomas: list[0],
        domain: list[1],
        school: list[2],
        // startDate: list[3],
        // endDate: list[4],
        // startDate: list[5],
        // endDate: list[6],
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    List<FormularField> fields = [
      FormularField(label: 'Diploma', hintText: 'diploma', isRequired: true),
      FormularField(
          label: 'Domain',
          hintText: 'what field do you have a degree in ?',
          isRequired: true),
      FormularField(label: 'School'),
      FormularField(
        label: 'Starting date',
        type: DateTime,
        inputType: TextInputType.datetime,
      ),
      FormularField(
        label: 'Ending date',
        type: DateTime,
        inputType: TextInputType.datetime,
      ),
    ];

    Formular form = Formular(
      formKey: formKey,
      title: 'Education',
      libelle:
          'Complete following fields to add  on your profile, you will be able to modify it later !',
      fields: fields,
      callback: (list) => _addEducation(list),
    );
    AlertDialog popUpFormular = AlertDialog(
      backgroundColor: Colors.white,
      content: SingleChildScrollView(child: form),
      contentPadding: EdgeInsets.zero,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.cancel_presentation_rounded))
      ],
    );

    return SizedBox(
        child: Column(children: [
      Column(
          children: educations.isEmpty
              ? [const Text("Empty")]
              : List.generate(educations.length, (index) => educations[index])
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
                        '${ModalRoute.of(context)!.settings.name}/addworkEducation')),
            icon: const Icon(Icons.add),
            label: const Text('Add education')),
      )
    ]));
  }
}
