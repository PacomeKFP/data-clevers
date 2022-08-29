part of home.components;

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
    return SizedBox(
      height: 70.0,
      child: Center(child: Text('DC', style: textStyles[1])),
    );
  }
}
