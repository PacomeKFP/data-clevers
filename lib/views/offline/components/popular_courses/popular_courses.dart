import 'src/courses.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularCourses extends StatelessWidget {
  const PopularCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      child: Column(
        children: [
          Column(children: [
            Text(
              "Find the right course for you, between ours ",
              textAlign: TextAlign.center,
              style: GoogleFonts.rosario(fontSize: 24),
            ),
            const SizedBox(height: 10),
            Text(
              "Don't worry to be lose "
              "Our Recommandation system will help you to get in touch"
              " with courses that are adapted for you "
              "However, we will help you in courses stydies planifications",
              textAlign: TextAlign.center,
              style: GoogleFonts.rosario(color: Colors.black87, fontSize: 18),
            ),
          ]),
          const SizedBox(height: 30),
          Wrap(
            children:const  [
              Courses(label: "Python For DataScience", duration: "6 hours"),
              Courses(label: "Algebra For DataScience", duration: "8 hours"),
              Courses(label: "Data Persistence", duration: "4 hours"),
              Courses(label: "Data Visualization", duration: "12 hours"),

              Courses(label: "Python For DataScience", duration: "6 hours"),
              Courses(label: "Algebra For DataScience", duration: "8 hours"),
              Courses(label: "Data Persistence", duration: "4 hours"),
              Courses(label: "Data Visualization", duration: "12 hours"),

              Courses(label: "Python For DataScience", duration: "6 hours"),
              Courses(label: "Algebra For DataScience", duration: "8 hours"),
              Courses(label: "Data Persistence", duration: "4 hours"),
              Courses(label: "Data Visualization", duration: "12 hours"),
            ],
          )
        ],
      ),
    );
  }
}
