part of auth.components;

class RoundedInput extends StatelessWidget {
  const RoundedInput({Key? key, required this.hintText, required this.icon})
      : super(key: key);
  final IconData icon;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
        child: TextField(
            cursorColor: AppColors.blue,
            decoration: InputDecoration(
              icon: Icon(icon, color: AppColors.blue),
              hintText: hintText,
              border: InputBorder.none,
              
            ),  ));
  }
}
