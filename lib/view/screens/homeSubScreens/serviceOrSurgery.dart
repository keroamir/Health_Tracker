import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad_pro/view/screens/homeSubScreens/resClininScreen.dart';
import 'package:grad_pro/view/screens/navBar/layoutScreen.dart';

import '../../../component/customText.dart';
import '../../../component/resClinicCard.dart';
import '../../../constant.dart';

class ServiceOrSurgery extends StatefulWidget {
  const ServiceOrSurgery({Key? key}) : super(key: key);

  @override
  State<ServiceOrSurgery> createState() => _ServiceOrSurgeryState();
}

class _ServiceOrSurgeryState extends State<ServiceOrSurgery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.centerRight,
          child: CustomText(
              direction: TextDirection.rtl,
              align: TextAlign.right,
              text: "خدمة أو عملية",
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
                return LayoutScreen();
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CarouselSlider(
              items: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset("assets/images/1.png", fit: BoxFit.fill),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset("assets/images/2.png", fit: BoxFit.fill),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset("assets/images/3.png", fit: BoxFit.fill),
                ),
              ],
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height / 5,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 300),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (BuildContext context) {
                        return ResClinicScreen(
                          title: "الاقسام",
                        );
                      }));
                    },
                    child: CustomText(
                        text: "عرض الكل",
                        color: active,
                        size: 20,
                        weight: FontWeight.normal)),
                CustomText(
                    text: "الاقسام",
                    color: black,
                    size: 24,
                    weight: FontWeight.bold),
              ],
            ),
          ),
          GridView(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            shrinkWrap: true,
            reverse: true,
            children: [
              ResClinicCrad(
                  image:
                      "assets/images/lady-with-plaster-nose-doctor-examining-patients-face-after-plastic-surgery_124865-2570.png",
                  name: "أنف وأذن"),
              ResClinicCrad(
                  image:
                      "assets/images/gynecologist-doctor-consulting-patient-using-uterus-anatomy-model_130111-1800.png",
                  name: "باطنة"),
              ResClinicCrad(
                  image:
                      "assets/images/man-sitting-psychologist-s-office-talking-about-problems_1157-28351.png",
                  name: "نفسيه"),
            ],
          ),
        ],
      ),
    );
  }
}
