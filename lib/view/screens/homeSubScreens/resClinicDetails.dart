import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HealthTracker/component/docInfoCard.dart';
import 'package:HealthTracker/component/searchBar.dart';
import 'package:HealthTracker/view/screens/homeSubScreens/resClininScreen.dart';

import '../../../component/customText.dart';
import '../../../constant.dart';
import '../../../component/DoctorInfo.dart';

class ResClinicDetails extends StatefulWidget {
  String? name;

  ResClinicDetails({required this.name});

  @override
  State<ResClinicDetails> createState() => _ResClinicDetailsState();
}

class _ResClinicDetailsState extends State<ResClinicDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        title: Container(
          alignment: Alignment.centerRight,
          child: CustomText(
              direction: TextDirection.rtl,
              align: TextAlign.right,
              text: "${widget.name}",
              color: black,
              size: 24,
              weight: FontWeight.normal),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward_ios, color: black),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  CupertinoPageRoute(builder: (BuildContext context) {
                return ResClinicScreen();
              }), (Route<dynamic> route) => false);
            },
          ),
          SizedBox(
            width: 15,
          ),
        ],
        elevation: 5,
        shadowColor: disabled,
        backgroundColor: white,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  color: bg),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: SearchBars(),
              )),
          GestureDetector(
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) {
                return DoctorInfoScreen();
              }));
            },
              child: DocInfoCard(
                  image: "assets/images/3485318.png",
                  name: "محمود جمال الكومي",
                  pro: "انف واذن",
                  location: "الرياض / شارع الجامعة",
                  price: "200 ريال",
                  rating: "4.7",
                  distance: "10 كم")),
          DocInfoCard(
              image: "assets/images/12346.png",
              name: "هشام إبراهيم التطاوي",
              pro: "انف واذن",
              location: "مكة / شارع الملك",
              price: "110 ريال",
              rating: "4.9",
              distance: "186 كم")
        ],
      ),
    );
  }
}
