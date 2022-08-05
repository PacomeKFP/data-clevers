part of profile;

class CertificationProfile extends StatefulWidget {
  const CertificationProfile({Key? key}) : super(key: key);

  @override
  State<CertificationProfile> createState() => _CertificationProfileState();
}

class _CertificationProfileState extends State<CertificationProfile> {
  _addExperience(list) {
    setState(() {
      certifications.add(Certification(
          certificateName: list[0],
          domain: list[1],
          transmitter: list[2],
          date: list[3],
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    List<FormularField> fields = [
      FormularField(
          label: 'Certificate Name',
          isRequired: true),
      FormularField(
          label: 'Domain',
          hintText: 'In which structure was you ?',
          isRequired: true),
      FormularField(
          label: 'Transmitter',
          hintText: 'Name of structure  ?',
          isRequired: true),
    ];
    Formular form = Formular(
      formKey: formKey,
      title: 'Tell us about your Certificat',
      libelle:
          'Complete following fields to add new certificate on your profile, you will be able to modify it later !',
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
          children: certifications.isEmpty
              ? [const Text("No Certificate yet added")]
              : List.generate(certifications.length, (index) => certifications[index])
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
                        '${ModalRoute.of(context)!.settings.name}/addCertificate')),
            icon: const Icon(Icons.add),
            label: const Text('Add a new certificate')),
      )
    ]));
  }
}
