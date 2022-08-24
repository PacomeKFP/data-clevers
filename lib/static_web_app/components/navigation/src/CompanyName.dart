part of side_navigation.components;

class CompanyName extends StatefulWidget {
  CompanyName({Key? key, required this.isCollapsed}) : super(key: key);
  final bool isCollapsed;

  @override
  State<CompanyName> createState() => _CompanyNameState();
}

class _CompanyNameState extends State<CompanyName> {


  @override
  Widget build(BuildContext context) {
    List<TextStyle> textStyles = [
      TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.softBlue,
          fontSize: 16.0),
      TextStyle(
          fontWeight: FontWeight.w700,
          color: AppColors.softBlue,
          fontSize: 18.0)
    ];
    return AnimatedContainer(
        duration: Duration(milliseconds: 475),
        height: 70.0,
        child: Center(
            child: AnimatedTextKit(
              isRepeatingAnimation: true,
          animatedTexts: [TyperAnimatedText('DC', textStyle: textStyles[1])],
        )));
  }
}
