import 'package:aptitudes/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroLanding extends StatelessWidget {
  HeroLanding({Key? key}) : super(key: key);

  final GlobalKey _imgKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
          alignment: Alignment.center,
          fit: StackFit.passthrough,
          children: [
            Opacity(opacity: 0.4, child: Image.asset("images/bg-2.jpg")),

            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Learning DataScience can now \n be done online much easily",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkBlue)),
              const SizedBox(height: 40),
              Text(
                "You can access more than 600 different courses from more than 6 differents Trainings,"
                "\nYou can also earn certificates & Apply for Jobs",
                textAlign: TextAlign.center,
                style: GoogleFonts.raleway(
                    fontSize: 24, color: AppColors.darkBlue),
              )
            ]),

            //TODO :: Add Another layer or
          ]),
    );
  }
}
