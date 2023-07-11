import 'package:flutter/cupertino.dart';
import 'package:HealthTracker/view/screens/homeSubScreens/resClininScreen.dart';
import 'package:HealthTracker/view/screens/homeSubScreens/serviceOrSurgery.dart';

import '../constant.dart';
import 'customText.dart';

// ignore: must_be_immutable
class GridCard extends StatelessWidget {
  String text;
  String image;

  GridCard({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (text == "خدمة أو عملية") {
          Navigator.push(context,
              CupertinoPageRoute(builder: (BuildContext context) {
            return const ServiceOrSurgery();
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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
            padding: const EdgeInsets.only(top: 10, right: 10),
            alignment: Alignment.topRight,
            child: CustomText(
                text: text, color: white, size: 18, weight: FontWeight.bold)),
      ),
    );
  }
}
