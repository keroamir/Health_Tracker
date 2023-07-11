import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HealthTracker/view/screens/homeSubScreens/resClinicDetails.dart';

import '../constant.dart';
import 'customText.dart';

// ignore: must_be_immutable
class ResClinicCrad extends StatelessWidget {
  String image;
  String? name;

  ResClinicCrad({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            CupertinoPageRoute(builder: (BuildContext context) {
          switch (name) {
            case "أنف وأذن":
              return ResClinicDetails(name: name);
            case "باطنة":
              return ResClinicDetails(name: name);
            case "نفسيه":
              return ResClinicDetails(name: name);
            case "عظام":
              return ResClinicDetails(name: name);
            case "اسنان":
              return ResClinicDetails(name: name);
            default:
              throw Exception("Unexpected name: $name");
          }
        }));
      },
      child: Card(
        elevation: 150,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        shadowColor: disabled,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image(image: AssetImage(image)),
            ),
            CustomText(
              text: "$name",
              color: black,
              size: 20,
              weight: FontWeight.normal,
              direction: TextDirection.rtl,
            )
          ],
        ),
      ),
    );
  }
}
