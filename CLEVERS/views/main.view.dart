import 'package:data_clevers/partials/_heroLanding.dart';
import 'package:data_clevers/partials/btn.dart';
import 'package:data_clevers/settings/Colors.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    return Container(
      // alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.05),
      width: MediaQuery.of(context).size.width*0.8,
      child: ListView(
        shrinkWrap: true,
        children: [
          Wrap(
            direction: Axis.horizontal,
            children: [
              SizedBox(height: 50, width: width*0.6),
              herolanding(context),
              SizedBox(height: 50, width: width*0.6),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "105 Cours",
                    style: TextStyle(color: Clors().darkBlue, fontSize: 24),
                  ),
                  btn2()
                ],
              ),
              SizedBox(height: 50, width: width*0.6),
              
              Row(
                
                children: [
                  boxSection
                ],
              ),
              SizedBox(height: 50, width: width,)
            ],
          ),
        ],
      ),
    );
  }
}
