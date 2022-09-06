import 'dart:math';

import 'package:aptitudes/config/colors.dart';
import 'package:aptitudes/config/logo.dart';
import 'package:faker_dart/faker_dart.dart';
import 'src/testimonial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class TestimonialsAboutUs extends StatelessWidget {
  const TestimonialsAboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScrollController _scrollController = ScrollController();
    final Faker faker = Faker.instance;
    return Container(
        width: size.width * 7 / 8,
        child: Column(children: [
          Row(
            children: [
              Text("People", style: GoogleFonts.poppins(fontSize: 36)),
              Icon(Feather.heart, color: AppColors.blue, size: 36),
              AppGlobals.appName(fontSize: 36),
            ],
          ),

          ///Testimonial Row here ||-->
          ///

          SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List<Testimonial>.generate(
                  Random().nextInt(6) + 4,
                  (index) => Testimonial(
                      subject: faker.lorem.sentence(),
                      content: faker.lorem.paragraph(),
                      user: faker.name.fullName())).toList(),
            ),
          )
        ]));
  }
}
