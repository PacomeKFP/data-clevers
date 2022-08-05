// part of ui;

import 'dart:math';

import 'package:data_clevers/blocs/globals/globals_cubit.dart';
import 'package:data_clevers/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sprung/sprung.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final List<IconData> iconData = <IconData>[
      Icons.call,
      Icons.school,
      Icons.home,
      Icons.h_mobiledata
    ];

    IconData randomIcon2() => iconData[Random().nextInt(iconData.length)];
    return BlocBuilder<GlobalsCubit, GlobalsState>(
      builder: (context, state) {
        return Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: height / 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppLogo(),
                    Text(
                      textAlign: TextAlign.center,
                      AppStrings.welcomeText[state.lang]!,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppStrings.whatDoYouWant[state.lang]!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      runSpacing: 20,
                      spacing: 20,
                      children: List<AnimatedCourse>.generate(
                          Random().nextInt(10),
                          (index) => AnimatedCourse(
                              icon: randomIcon2(),
                              title: "Texte $index")).toList(),
                    )
                  ])),
        );
      },
    );
  }
}

class AnimatedCourse extends StatefulWidget {
  final IconData icon;
  final String title;

  const AnimatedCourse({super.key, required this.icon, required this.title});

  @override
  State<AnimatedCourse> createState() => _AnimatedCourseState();
}

class _AnimatedCourseState extends State<AnimatedCourse> {
  onEntered(bool e) {
    setState(() {
      isHover = e;
    });
  }

  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()
      ..translate(-5, -5, 5)
      ..scale(1.01);
    final transform = isHover ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
      onEnter: (e) => onEntered(true),
      onExit: (e) => onEntered(false),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, '/course/${widget.title}'),
        child: AnimatedContainer(
          curve: Sprung.overDamped,
          duration: Duration(milliseconds: 200),
          transform: transform,
          decoration: BoxDecoration(
              color: AppColors.blanc,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          alignment: Alignment.center,
          width: 300,
          height: 275,
          child: Column(
            children: [
              Container(
                height: 210,
                alignment: Alignment.center,
                width: 290,
                child: CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.blue_blak,
                    child: Icon(widget.icon)),
              ),
              Divider(thickness: 2, color: AppColors.grey),
              Container(
                width: 290,
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  widget.title,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: AppColors.blue_blak),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
