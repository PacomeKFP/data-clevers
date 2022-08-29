part of auth.components;

class RoundedButton extends StatefulWidget {
  const RoundedButton(
      {Key? key,
      required this.title,
      this.image,
      this.bgColor,
      this.txtColor,
      this.tapEvent,
      this.height = 60})
      : super(key: key);

  final String title;
  final String? image;
  final Color? bgColor;
  final Color? txtColor;
  final double? height;
  final GestureTapCallback? tapEvent;

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  late FontWeight _fontWeight;
  double _fontSize = 18;
  late double elevation;
  late Color bgColor;
  late Color _bgColor;

  @override
  void initState() {
    _fontWeight = FontWeight.normal;
    elevation = 10;
    bgColor = widget.bgColor ?? AppColors.blue;
    _bgColor = bgColor.withAlpha(200);
    super.initState();
  }

  void changeElevation() {
    setState(() {
      elevation = elevation == 10 ? 20 : 10;
      _fontWeight = _fontWeight == FontWeight.normal
          ? FontWeight.bold
          : FontWeight.normal;
      _bgColor = _bgColor == bgColor.withAlpha(200)
          ? bgColor.withAlpha(210)
          : bgColor.withAlpha(200);
      _fontSize = _fontSize == 18 ? 19 : 18;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MouseRegion(
      onEnter: (e) => changeElevation(),
      onExit: (e) => changeElevation(),
      child: Card(
        color: Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        margin: const EdgeInsets.symmetric(vertical: 10),
        elevation: 10,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: _bgColor,
          ),
          height: widget.height,
          width: size.width * 0.8,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: widget.tapEvent,
            child: Stack(
              children: [
                if (widget.image != null)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 25,
                      child: Image.asset(widget.image!),
                    ),
                  ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        color: widget.txtColor,
                        fontWeight: _fontWeight,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
