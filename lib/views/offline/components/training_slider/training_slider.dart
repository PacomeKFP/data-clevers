import 'dart:async';
import 'package:flutter/material.dart';
import 'src/training_item.dart';

class TrainingSlider extends StatefulWidget {
  const TrainingSlider({Key? key}) : super(key: key);

  @override
  State<TrainingSlider> createState() => _TrainingSliderState();
}

class _TrainingSliderState extends State<TrainingSlider> {
  _slide() {
    Timer(Duration(seconds: 2), (() async {}));
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) => _slide());
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        width: MediaQuery.of(context).size.width - 100,
        alignment: Alignment.center,
        child: Scrollbar(
          controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                TrainingSliderItem(
                  image: "carousel/001.png",
                  title: "Data Analysis",
                  courses: 7,
                ),
                TrainingSliderItem(
                  image: "carousel/002.png",
                  title: "Machine Learning",
                  courses: 8,
                ),
                TrainingSliderItem(
                  image: "carousel/003.png",
                  title: "Data Mining",
                  courses: 12,
                ),
                TrainingSliderItem(
                  image: "carousel/004.png",
                  title: "Data Engeneering",
                  courses: 7,
                ),
                TrainingSliderItem(
                  image: "carousel/005.png",
                  title: "Data ....",
                  courses: 7,
                ),
              ],
            ),
          ),
        ));
  }
}
