import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad_pro/view/screens/homeSubScreens/resClininScreen.dart';
import 'package:grad_pro/view/screens/homeSubScreens/serviceOrSurgery.dart';

import '../constant.dart';
import 'customText.dart';

class GridCard extends StatelessWidget {
  String text;
  String image;

  GridCard({required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (text == "خدمة أو عملية") {
          Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) {
            return ServiceOrSurgery();
          }));
        } else {
          Navigator.push(context,
              CupertinoPageRoute(builder: (BuildContext context) {
            return ResClinicScreen(
              title: text,
            );
          }));
        }
      },
      child: Container(
        child: Container(
            padding: EdgeInsets.only(top: 10, right: 10),
            alignment: Alignment.topRight,
            child: CustomText(
                text: "$text",
                color: white,
                size: 18,
                weight: FontWeight.bold)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage("$image"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
