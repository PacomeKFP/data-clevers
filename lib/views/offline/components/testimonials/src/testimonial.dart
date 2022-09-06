import 'package:flutter/material.dart';

class Testimonial extends StatelessWidget {
  const Testimonial({Key? key, required this.subject, required this.content, required this.user}) : super(key: key);

  final String subject; 
  final String content; 
  final String user; 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300*1.61,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical:14),
      margin: EdgeInsets.all(10),
      decoration:  BoxDecoration(),
      child: Stack(),
    );
  }
}