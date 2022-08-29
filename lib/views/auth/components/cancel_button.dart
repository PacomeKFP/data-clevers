part of auth.components;

class CancelButton extends StatefulWidget {
  const CancelButton(
      {Key? key,
      required this.animationDuration,
      required this.isLogin,
      required this.onTap})
      : super(key: key);
  final Duration animationDuration;
  final bool isLogin;
  final GestureTapCallback? onTap;

  @override
  State<CancelButton> createState() => _CancelButtonState();
}

class _CancelButtonState extends State<CancelButton> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return AnimatedOpacity(
      opacity: !widget.isLogin ? 1 : 0,
      duration: widget.animationDuration * 4,
      child: Align(
        alignment: Alignment.topCenter,
        child: IconButton(
          onPressed: widget.onTap,
          icon: const Icon(Icons.close),
          color: AppColors.blue,
        ),
      ),
    );
  }
}


