part of home.components;

class CourseLineItem extends StatefulWidget {
  const CourseLineItem({
    Key? key,
    required this.color,
    required this.instructor,
    required this.title,
    required this.duration,
    required this.progression,
  }) : super(key: key);

  final Color color;

  final String instructor;
  final String title;
  final String duration;
  final double progression;

  @override
  State<CourseLineItem> createState() => _CourseLineItemState();
}

class _CourseLineItemState extends State<CourseLineItem> {
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
        margin: const EdgeInsets.only(bottom: 10, left: 40, right: 15),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColors.softBlue,
            borderRadius: BorderRadius.circular(10),
            boxShadow: !_isHovered
                ? [
                    BoxShadow(
                      color: widget.color.withOpacity(0.2),
                      blurRadius: 13.0,
                      spreadRadius: 0.0,
                    )
                  ]
                : [
                    BoxShadow(
                      color: widget.color,
                      blurRadius: 3.0,
                      spreadRadius: 0.0,
                    )
                  ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 15),
                    // Container(
                    //   height: 50,
                    //   width: 28,
                    //   decoration: BoxDecoration(
                    //       color: widget.color.withOpacity(0.2),
                    //       borderRadius: BorderRadius.circular(5)),
                    //   child: Center(
                    //     child: Icon(
                    //       Feather.folder,
                    //       color: widget.color,
                    //       size: 15,
                    //     ),
                    //   ),
                    // ),

                    _circularPercent(progression: widget.progression, color: widget.color),
                    SizedBox(width: 15),
                    Text(
                      widget.title,
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _fileAttribute(label: widget.duration, icon: Feather.clock),
                    _fileAttribute(
                        label: widget.instructor, icon: Feather.user),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _fileAttribute(
      {required String label, Color color = Colors.black45, IconData? icon}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Icon(icon, color: widget.color),
          if (icon != null) const SizedBox(width: 5),
          Text(
            label,
            style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold, fontSize: 11, color: color),
          ),
        ],
      ),
    );
  }

  _circularPercent({required double progression, Color? color}) {
    Color _color;
    _color = color ?? AppColors.blue;
    return CircularPercentIndicator(
      animation: true,
      radius: 20,
      lineWidth: 2.5,
      percent: progression,
      circularStrokeCap: CircularStrokeCap.round,
      center: progression == 1 ? Icon(Feather.check, color: Colors.lightGreenAccent,) :Text(
        '${progression * 100} %',
        style: GoogleFonts.quicksand(
          fontWeight: FontWeight.w700,
          color: _color,
          fontSize: 13,
        ),
      ),
      // progressColor: Colors.white,
      progressColor: _color,
      startAngle: 270,
      backgroundColor: Colors.white,
    );
  }
}
