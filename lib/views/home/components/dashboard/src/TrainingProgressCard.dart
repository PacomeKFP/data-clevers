part of home.components;

class TrainingProgressCard extends StatefulWidget {
  const TrainingProgressCard(
      {Key? key,
      required this.color,
      required this.progressIndicatorColor,
      required this.projectName,
      required this.percentCompleted,
      required this.icon})
      : super(key: key);

  final Color color;
  final Color progressIndicatorColor;
  final String projectName;
  final double percentCompleted;
  final IconData icon;
  

  @override
  State<TrainingProgressCard> createState() => _TrainingProgressCardState();
}

class _TrainingProgressCardState extends State<TrainingProgressCard> {
  bool _isHovered = false;
  Duration animationDuration = Duration(milliseconds: 275);
  void _mouseRegionHandler(bool value) {
    setState(() {
      _isHovered = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseRegionHandler(true),
      onExit: (e) => _mouseRegionHandler(false),
      child: AnimatedContainer(
        duration: animationDuration,
        height: _isHovered ? 160 : 155,
        width: _isHovered ? 200 : 195,
        decoration: BoxDecoration(
            color: _isHovered ? widget.color : AppColors.softBlue,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 20.0,
                spreadRadius: 5.0,
              )
            ]),
        child: Center(
            child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 18),
                AnimatedContainer(
                  duration: animationDuration,
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: _isHovered ? AppColors.softBlue : AppColors.black,
                  ),
                  child: Icon(widget.icon,
                      color: !_isHovered ? AppColors.softBlue : AppColors.black,
                      size: 16),
                ),
                const SizedBox(width: 18),
                Container(
                  child: Text(
                    widget.projectName,
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: _isHovered ? AppColors.white : AppColors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            _getRow(Feather.activity, '8 Courses'),
            const SizedBox(height: 5),
            _getRow(Feather.video, '96 Hours'),
            Container(
              margin: EdgeInsets.only(top: 8, left: 135),
              child: Text(
                '${widget.percentCompleted}%',
                style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.5,
                    color: _isHovered ? AppColors.white : AppColors.black),
              ),
            ),
            AnimatedContainer(
              duration: animationDuration,
              margin: EdgeInsets.only(top: 5),
              height: 6,
              width: 160,
              decoration: BoxDecoration(
                color: _isHovered
                    ? widget.progressIndicatorColor
                    : Color(0xfff5f6fa),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: AnimatedContainer(
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: animationDuration,
                  height: 6.0,
                  width: (widget.percentCompleted / 100 * 160),
                  decoration: BoxDecoration(
                    color: _isHovered ? AppColors.white : widget.color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }

  _getRow(IconData icon, String label) {
    return Row(
      children: [
        const SizedBox(width: 18),
        Container(
          height: 13,
          width: 13,
          child: Icon(
            icon,
            size: 13,
            color: _isHovered ? AppColors.white : AppColors.black,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w500,
              fontSize: 10,
              color: _isHovered ? AppColors.white : AppColors.black),
        )
      ],
    );
  }
}
