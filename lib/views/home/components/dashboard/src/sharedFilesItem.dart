part of home.components;

class SharedFilesItem extends StatefulWidget {
  const SharedFilesItem(
      {Key? key,
      required this.color,
      required this.sharedFileName,
      required this.membersNumber,
      required this.date,
      required this.fileSize})
      : super(key: key);

  final Color color;
  final String sharedFileName;
  final double membersNumber;
  final String date;
  final String fileSize;

  @override
  State<SharedFilesItem> createState() => _SharedFilesItemState();
}

class _SharedFilesItemState extends State<SharedFilesItem> {
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
                    Container(
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                          color: widget.color.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Icon(
                          Feather.folder,
                          color: widget.color,
                          size: 15,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
                      widget.sharedFileName,
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _fileAttribute(label: "${widget.membersNumber} members"),
                    _fileAttribute(label: widget.date),
                    _fileAttribute( label: widget.fileSize, color: Colors.black87),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _fileAttribute({required String label, Color color = Colors.black45}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        label,
        style: GoogleFonts.quicksand(
            fontWeight: FontWeight.bold, fontSize: 11, color: color),
      ),
    );
  }
}
