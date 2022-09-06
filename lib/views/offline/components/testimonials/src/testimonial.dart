import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:aptitudes/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class Testimonial extends StatelessWidget {
  const Testimonial(
      {Key? key,
      required this.subject,
      required this.content,
      required this.user})
      : super(key: key);

  final String subject;
  final String content;
  final String user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 350,
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.softBlue, width: 2),
          color: AppColors.softBlue.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        AnimatedTextKit(
          isRepeatingAnimation: false,
          animatedTexts: [
            TyperAnimatedText(subject,
                textStyle: GoogleFonts.ubuntu(
                  fontSize: 24,
                  color: Color.fromARGB(255, 0, 55, 80),
                )),
          ],
        ),
        const SizedBox(height: 15),
        AnimatedTextKit(
          isRepeatingAnimation: false,
          animatedTexts: [
            TyperAnimatedText(content,
                textStyle: GoogleFonts.ubuntu(
                  fontSize: 16,
                  color: Color.fromARGB(165, 0, 55, 80),
                )),
          ],
        ),
        const SizedBox(height: 20),
        Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("- $user",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.ubuntu(
                      fontSize: 16,
                      color: Color.fromARGB(164, 1, 35, 51),
                    )),
                Icon(
                  FontAwesome.user,
                  size: 24,
                  color: AppColors.purple,
                ),
              ],
            )),
      ]),
    );
  }
}
