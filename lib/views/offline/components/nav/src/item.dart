import 'package:aptitudes/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutNavItem extends StatefulWidget {
  const OutNavItem({Key? key, required this.title, this.dataKey})
      : super(key: key);

  final String title;
  final GlobalKey? dataKey;
  @override
  State<OutNavItem> createState() => _OutNavItemState();
}

class _OutNavItemState extends State<OutNavItem> {
  bool isHover = false;

  _mouseEnter(bool e) =>
    setState(() => isHover = e);
  

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: InkWell(
        onTap: widget.dataKey == null
            ? null
            : () => Scrollable.ensureVisible(widget.dataKey!.currentContext!, curve: Curves.fastLinearToSlowEaseIn, duration: Duration(seconds:2)),
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        child: AnimatedDefaultTextStyle(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: const Duration(milliseconds: 275),
          style: isHover
              ? TextStyle(
                  color: AppColors.darkBlue, fontWeight: FontWeight.bold)
              : TextStyle(
                  color: AppColors.blue, fontWeight: FontWeight.normal),
          child: Text(widget.title),
        ),
      ),
    );
  }
}
