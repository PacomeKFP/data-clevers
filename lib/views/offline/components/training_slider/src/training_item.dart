import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrainingSliderItem extends StatelessWidget {
  const TrainingSliderItem(
      {Key? key,
      required this.image,
      required this.title,
      required this.courses})
      : super(key: key);
  final String image;
  final String title;
  final int courses;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 230,
        height: 210,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: const BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 80, width: 80),
            const SizedBox(height: 5),
            Text(title, style: GoogleFonts.robotoFlex(fontSize: 16)),
            const SizedBox(height: 5),
            Text("$courses Courses available",
                style:
                    GoogleFonts.robotoFlex(fontSize: 14, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
