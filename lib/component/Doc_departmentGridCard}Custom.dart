import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad_pro/component/customText.dart';
import 'package:grad_pro/constant.dart';


import '../view/docView/navBar/navScreens/docMsgNavPages/blood_pressure.dart';
import '../view/docView/navBar/navScreens/docMsgNavPages/heart_beating.dart';
import '../view/docView/navBar/navScreens/docMsgNavPages/suger_Blood.dart';
import '../view/docView/navBar/navScreens/docMsgNavPages/temperature.dart';


class Doc_departmentGridCard extends StatelessWidget {
  String text;
  String image;

  Doc_departmentGridCard({required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (text == "نبض الفلب") {
          Navigator.push(context,
              CupertinoPageRoute(builder: (BuildContext context) {
            return heart_beating(
              title: text,
            );

          }));
        } else if (text == "السكر") {
          Navigator.push(context,
              CupertinoPageRoute(builder: (BuildContext context) {
            return suger_Blood(
              title: text,
            );
          }));
        } else if (text == "درجة الحراره") {
          Navigator.push(context,
              CupertinoPageRoute(builder: (BuildContext context) {
            return temperature(
              title: text,
            );
          }));
        } else {
          Navigator.push(context,
              CupertinoPageRoute(builder: (BuildContext context) {
            return blood_pressure(
              title: text,
            );
          }));
        }
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage("$image"),
                fit: BoxFit.fill,
              ),
            ),

          ),
          SizedBox(
            height: 100,
          ),
           Container(
                alignment: Alignment.bottomCenter,
                child: CustomText(
                    text: "$text",
                    color: black,
                    size: 30,
                    weight: FontWeight.bold)
           ),

        ],
      ),
    );
  }
}
