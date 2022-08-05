part of profile;

class ExperienceProfile extends StatefulWidget {
  const ExperienceProfile({Key? key}) : super(key: key);

  @override
  State<ExperienceProfile> createState() => _ExperienceProfileState();
}

class _ExperienceProfileState extends State<ExperienceProfile> {
  _addExperience(list) {
    setState(() {
      experiences.add(WorkExperience(
          title: list[0],
          employer: list[1],
          employerUrl: list[2],
          employerContact: list[3],
          domain: list[4],
          // startDate: list[5],
          // endDate: list[6],
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
      FormularField(label: 'Employer website URL'),
      FormularField(label: 'Employer Contact'),
      FormularField(label: 'The work field of your employer '),
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
      title: 'New Work Experience',
      libelle:
          'Complete following fields to add new work Experience on your profile, you will be able to modify it later !',
      fields: fields,
      callback: (list) => _addExperience(list),
    );
    AlertDialog popUpFormular = AlertDialog(
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
          children: experiences.isEmpty
              ? [const Text("No Work experience yet added")]
              : List.generate(experiences.length, (index) => experiences[index])
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
                        '${ModalRoute.of(context)!.settings.name}/addworkExperience')),
            icon: const Icon(Icons.add),
            label: const Text('Add a work Eperience')),
      )
    ]));
  }
}
