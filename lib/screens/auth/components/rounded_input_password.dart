part of auth.components;

class RoundedPasswordInput extends StatelessWidget {
  RoundedPasswordInput(
      {Key? key, required this.hintText, required this.icon, this.compareTo})
      : super(key: key);
  final IconData icon;
  final String hintText;
  final CompareTo? compareTo;
  final TextEditingController? controller = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return InputContainer(
        child: TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: AppColors.blue,
      decoration: InputDecoration(
        icon: Icon(icon, color: AppColors.blue),
        hintText: hintText,
        border: InputBorder.none,
      ),
      validator: (value) {
        if (compareTo != null) {
          compareTo!.value == controller!.text ? null : compareTo!.onErrorText;
        }
        return value == null ? null : "This field is required";
      },
    ));
  }
}

class CompareTo {
  String? value;
  String? onErrorText;
  CompareTo({required this.value, required this.onErrorText});
}
