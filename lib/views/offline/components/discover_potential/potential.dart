import 'dart:developer';

import 'package:aptitudes/config/colors.dart';

import 'src/checked_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'src/discover_button.dart';

class DiscoverYourPotential extends StatelessWidget {
  const DiscoverYourPotential({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              flex: 1,
              child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Image.asset(
                    "images/2.png",
                    fit: BoxFit.fill,
                  ))),
          const SizedBox(width: 10),
          Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Discover your potential",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 32),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "It offers us a new way to explore subjects us tomfoolery"
                      " on the cheesed off I dropped a clanger to do with me bits"
                      " enthusiastic about exploring subjects us tomfoolery trusted our partners.",
                      textAlign: TextAlign.justify,
                      style:
                          GoogleFonts.poppins(fontSize: 22, color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    const CheckedLine(
                        label: "Learn the latest skills with a new way"),
                    const CheckedLine(
                        label: "Improve your organization's skills."),
                    const CheckedLine(
                        label: "You can choose a course from online"),
                    const CheckedLine(
                        label: "Learn the latest skills with a new way"),
                    const SizedBox(height: 10),
                    Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 10,
                      children: [
                        DiscoverButton(
                          bgColor: AppColors.blue,
                          label: 'Get Started',
                          lblColor: Colors.white,
                          tapCallback: () => log("Go to Quizz"),
                        ),
                        DiscoverButton(
                          bgColor: AppColors.blue.withOpacity(0.12),
                          label: 'Log in',
                          lblColor: AppColors.blue,
                          tapCallback: () => log("Log in to my Account"),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
