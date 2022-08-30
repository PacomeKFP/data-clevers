part of auth.components;

class RoundedInput extends StatelessWidget {
  const RoundedInput({Key? key, required this.hintText, required this.icon, this.controller})
      : super(key: key);
  final IconData icon;
  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
        child: TextField(
          controller: controller,
            cursorColor: AppColors.blue,
            decoration: InputDecoration(
              icon: Icon(icon, color: AppColors.blue),
              hintText: hintText,
              border: InputBorder.none,
              
            ),  ));
  }
}
