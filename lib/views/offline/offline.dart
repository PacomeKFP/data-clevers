import 'package:flutter/material.dart';
import 'package:aptitudes/config/colors.dart';

import 'components/testimonials/testimonials.dart';
import 'components/nav/nav.dart';
import 'components/training_slider/src/hero.dart';
import 'components/training_slider/training_slider.dart';
import 'components/popular_courses/popular_courses.dart';

import 'components/discover_potential/potential.dart';

class OutHomePage extends StatelessWidget {
  OutHomePage({Key? key}) : super(key: key);

  final List<GlobalKey> keys =
      List<GlobalKey>.generate(4, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white.withAlpha(250),
          centerTitle: true,
          title: OutNavBar(keys: keys),
        ),
        body: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        HeroLanding(),
                        const SizedBox(height: 250),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 400,
                    child: TrainingSlider(key: keys[0]),
                  ),
                ],
              ),
              DiscoverYourPotential(key: keys[1]),
              const SizedBox(height: 20),

              /// Here we display the part of ` popular courses of our platform `
              Container(
                  height: size.height,
                  alignment: Alignment.center,
                  child: PopularCourses(key: keys[2])),

              ///TODO : here we have to displaytestimonials about our solutions
              ///
              Container(
                  height: size.height,
                  alignment: Alignment.center,
                  child: TestimonialsAboutUs(key: keys[3])),
            ]),
          ),
        ));
  }
}
