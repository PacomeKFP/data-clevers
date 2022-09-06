import 'package:aptitudes/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Courses extends StatefulWidget {
  const Courses({Key? key, required this.label, required this.duration})
      : super(key: key);

  final String label;
  final String duration;

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  bool isHover = false;


  _entered(bool e)  => setState(() => isHover = e);

  @override
  Widget build(BuildContext context) {
    List<Color> _color = !isHover
        ? [Colors.black, Colors.black87]
        : [Colors.blueAccent, Colors.blueAccent.withOpacity(0.8)];
    return MouseRegion(
      onEnter:(e)=> _entered(true),
      onExit:(e)=> _entered(false),
      child: AnimatedContainer(
        curve:Curves.fastLinearToSlowEaseIn ,
        padding:const EdgeInsets.all(8),
        width: 200,
        height: 100,
        margin: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        duration: const Duration(seconds: 1),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: AppColors.softBlue, width: 2),
            color: isHover
                ? AppColors.softBlue
                : AppColors.softBlue.withOpacity(0.1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.label,
              textAlign: TextAlign.center,
              style: GoogleFonts.podkova(
                  fontSize: 16, fontWeight: FontWeight.w900, color: _color[0]),
            ),
            const SizedBox(height:5),
            Text(
              "Duration: ${widget.duration}",
              textAlign: TextAlign.center,
              style: GoogleFonts.podkova(color: _color[0]),
            ),
          ],
        ),
      ),
    );
  }
}
