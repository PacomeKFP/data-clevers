part of models;

class FormularField extends StatefulWidget {
  final String label;
  final String? hintText;
  final bool isRequired; //false
  final bool isObscurable; //false
  final TextInputType inputType;
  final String? defaultValue;
  TextEditingController? controller;
  final Type type;
  final bool isLongText;

  FormularField(
      {Key? key,
      required this.label,
      this.hintText,
      this.isRequired = false,
      this.isObscurable = false,
      this.inputType = TextInputType.text,
      this.defaultValue,
      this.controller,
      this.type = String,
      this.isLongText = false})
      : super(key: key);

  @override
  State<FormularField> createState() => FormularFieldState();
}

class FormularFieldState extends State<FormularField> {
  final GlobalKey<FormFieldState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // if (widget.type == Language) return languageFields();
    return BlocProvider(
      create: (context) => ToggleBloc(),
      child: BlocBuilder<ToggleBloc, ToggleState>(builder: (context, state) {
        bool obscure = (state as ToggleInitialState).isVisible;
        if (!widget.isObscurable) obscure = false;
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                    keyboardType: widget.inputType,
                    maxLines: widget.isLongText == true ? 8 : 1,
                    key: formKey,
                    controller: widget.controller,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if ((value == null || value.isEmpty) && widget.isRequired) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    obscureText: obscure,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 10),
                        border: const OutlineInputBorder(),
                        hintText: widget.hintText == null
                            ? widget.label
                            : widget.label,
                        labelText: widget.label,
                        suffix: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            widget.isRequired
                                ? const FaIcon(
                                    FontAwesomeIcons.triangleExclamation,
                                    color: Colors.redAccent,
                                    size: 16,
                                  )
                                : Visibility(visible: false, child: Wrap()),
                            widget.isObscurable
                                ? IconButton(
                                    onPressed: () => context
                                        .read<ToggleBloc>()
                                        .add(TogleHideEvent()),
                                    icon: obscure
                                        ? const FaIcon(
                                            FontAwesomeIcons.eyeSlash)
                                        : const FaIcon(FontAwesomeIcons.eye))
                                : Visibility(visible: false, child: Wrap())
                          ],
                        ))),
              ],
            ));
      }),
    );
  }

  // Widget languageFields() {
  //   List<Language> languages = [
  //     Language(abbr: 'fr', name: 'Français'),
  //     Language(abbr: 'en', name: 'Anglais'),
  //     Language(abbr: 'es', name: 'Espagnol'),
  //     Language(abbr: 'all', name: 'Allemand'),
  //   ];

  //   final _items = languages
  //       .map((language) => MultiSelectItem<Language>(language, language.name))
  //       .toList();
  //   return FormField(builder: (context) {
  //     return MultiSelectDialogField(
  //       autovalidateMode: AutovalidateMode.onUserInteraction,
  //       items: _items,
  //       title: const Text("Languages"),
  //       selectedColor: Colors.blue,
  //       decoration: BoxDecoration(
  //         color: Colors.blue.withOpacity(0.1),
  //         borderRadius: const BorderRadius.all(Radius.circular(40)),
  //         border: Border.all(
  //           color: Colors.blue,
  //           width: 2,
  //         ),
  //       ),
  //       buttonIcon: const Icon(
  //         Icons.pets,
  //         color: Colors.blue,
  //       ),
  //       buttonText: Text(
  //         "languages",
  //         style: TextStyle(
  //           color: Colors.blue[800],
  //           fontSize: 16,
  //         ),
  //       ),
  //       onConfirm: (results) {
  //         //_selectedAnimals = results;
  //       },
  //     );
  //   });
  // }

}
