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

    return SizedBox(
      height: 70.0,
      child: Center(
          child: widget.isCollapsed
              ? AppGlobals.logo(
                  bgColor: AppColors.darkBlue,
                  lblColor: AppColors.white,
                )
              : AppGlobals.appName(
                  bgColor: AppColors.darkBlue,
                  lblColor: AppColors.white,
                  fontSize: 24)),
    );
  }
}
