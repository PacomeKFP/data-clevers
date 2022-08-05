part of ui.widgets;

class Formular extends StatelessWidget {
  final String? title;
  final String libelle;
  Function(List<dynamic>)? callback;
  final bool? autoValidate;
  final List<Widget>? footer;
  final GlobalKey<FormState>? formKey;

  final List<FormularField> fields;
  Formular({
    Key? key,
    required this.title,
    required this.libelle,
    required this.fields,
    this.callback,
    this.autoValidate,
    this.footer,
    this.formKey,
  }) : super(key: key);

  List<TextEditingController> controllers = [];

  @override
  Widget build(BuildContext context) {
    //

    for (FormularField field in fields) {
      controllers.add(TextEditingController());
    }
//
    return Container(
      alignment: Alignment.center,
      // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      
      decoration:  BoxDecoration(
        color: Colors.white10,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
                offset: Offset(5, 5),
                // blurRadius: 12,
                blurStyle: BlurStyle.outer),
            BoxShadow(
                offset: Offset(-5, 5),
                // blurRadius: 12,
                blurStyle: BlurStyle.outer)
          ]),
      child: Column(
        children: [
          Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
              child: Column(
                children: [
                  Column(
                    children: [
                      Text(title!,
                          style: Theme.of(context).textTheme.headline4!),
                      Text(libelle,
                          style: Theme.of(context).textTheme.bodyMedium!),
                      const SizedBox(height: 10),
                    ],
                  ),
                  Column(
                    children:
                        List<FormularField>.generate(fields.length, (index) {
                      fields[index].controller = controllers[index];
                      return fields[index];
                    }),
                  ),
                  const SizedBox(height: 10),
                  if (callback != null)
                    OutlinedButton(
                      onPressed: () {
                        if (formKey!.currentState!.validate()) {
                          callback!(List.generate(fields.length, (index) {
                            print(fields[index].controller!.text);
                            return fields[index].controller!.text;
                          }).toList());

                          Navigator.pop(context);
                        }
                      },
                      child: const Text("Validate"),
                    )
                ],
              )),
          if (footer != null)
            for (Widget widget in footer!) widget
        ],
      ),
    );
  }
}
