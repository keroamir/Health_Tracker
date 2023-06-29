import 'package:HealthTracker/view/screens/homeSubScreens/reservation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:HealthTracker/component/customText.dart';
import 'package:HealthTracker/constant.dart';
import 'package:HealthTracker/view/screens/navBar/layoutScreen.dart';


class DoctorInfoScreen extends StatefulWidget {
  const DoctorInfoScreen({Key? key}) : super(key: key);

  @override
  State<DoctorInfoScreen> createState() => _DoctorInfoScreenState();
}

class _DoctorInfoScreenState extends State<DoctorInfoScreen> {





  final int? numOfVisitors = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.centerRight,
          child: CustomText(
              direction: TextDirection.rtl,
              align: TextAlign.right,
              text: "بيانات الطبيب",
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
      backgroundColor: bg,
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 22,
                      ),
                      // first card
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: white,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        // left icons
                                        Row(
                                          children: [
                                            const Icon(Icons.share),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                                  20,
                                            ),
                                            SvgPicture.asset(
                                                "assets/icons/heart_icon.svg"),
                                          ],
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width /
                                              2,
                                        ),
                                        // right icons
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                "assets/icons/Star_icon.svg"),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            CustomText(
                                                text: "5/",
                                                color: subText,
                                                size: 18,
                                                weight: FontWeight.normal),
                                            CustomText(
                                                text: "4.5",
                                                color: active,
                                                size: 22,
                                                weight: FontWeight.bold),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15),
                              CustomText(
                                  text: "بيتر عوني حبيب",
                                  color: black,
                                  size: 30,
                                  weight: null),
                              const SizedBox(height: 10),
                              // انف و اذن
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                      text: "انف و اذن",
                                      color: black,
                                      size: 20,
                                      weight: null),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  SvgPicture.asset(
                                      "assets/icons/noseandear.svg"),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomText(
                                    align: TextAlign.center,
                                    text:
                                    "بيتر عوني حبيب بيتر عوني حبيب بيتر عوني حبيب بيتر عوني حبيب بيتر عوني حبيب بيتر عوني حبيب بيتر عوني حبيب بيتر عوني حبيب ",
                                    color: Colors.black26,
                                    size: 15,
                                    weight: null),
                              ),
                              const Divider(
                                color: Colors.black38,
                                height: 6,
                                thickness: 1,
                                endIndent: 100,
                                indent: 100,
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                    text: "100 LE",
                                    color: active,
                                    size: 16,
                                    weight: FontWeight.bold,
                                    direction: TextDirection.rtl,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  CustomText(
                                      text: "سعر الكشف",
                                      color: black,
                                      size: 20,
                                      weight: null),
                                  const SizedBox(width: 5),
                                  SvgPicture.asset(
                                      "assets/icons/offer_icon.svg"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: white,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: "10 Km",
                                    color: subText,
                                    size: 18,
                                    weight: FontWeight.normal,
                                    direction: TextDirection.rtl,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CustomText(
                                        text: "menof",
                                        color: black,
                                        size: 18,
                                        weight: FontWeight.normal,
                                        direction: TextDirection.rtl,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      SvgPicture.asset(
                                          "assets/icons/location_sign.svg"),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Image.asset(""),
                              const Text("Location"),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        //  third card
                        child: Card(
                          color: white,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          // left icons
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  "assets/icons/Star_icon.svg"),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              CustomText(
                                                  text: "5/",
                                                  color: subText,
                                                  size: 18,
                                                  weight: FontWeight.normal),
                                              CustomText(
                                                  text: "4.5",
                                                  color: active,
                                                  size: 22,
                                                  weight: FontWeight.bold),
                                            ],
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width /6

                                          ),
                                          // right part of row
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: [
                                                  CustomText(
                                                      text:
                                                      "(من $numOfVisitors زائر )",
                                                      color: black,
                                                      size: 20,
                                                      weight: null),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  CustomText(
                                                      text: "التقييمات",
                                                      color: black,
                                                      size: 20,
                                                      weight: null),
                                                  SizedBox(
                                                    width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                        30,
                                                  ),
                                                  SvgPicture.asset(
                                                      "assets/icons/Star_icon.svg"),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Card(
                                        elevation: 5,
                                        color: cardBG,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: white,
                                                  borderRadius:
                                                  BorderRadius.circular(15),
                                                ),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        "assets/icons/Star_icon.svg"),
                                                    SvgPicture.asset(
                                                        "assets/icons/Star_icon.svg"),
                                                    SvgPicture.asset(
                                                        "assets/icons/Star_icon.svg"),
                                                    SvgPicture.asset(
                                                        "assets/icons/Star_icon.svg"),
                                                    const SizedBox(
                                                      width: 25,
                                                    ),
                                                    CustomText(
                                                        text: "10/10/2020",
                                                        color: black,
                                                        size: 20,
                                                        weight: null),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CustomText(
                                                align: TextAlign.start,
                                                text: "احمد سمير",
                                                color: black,
                                                size: 25,
                                                weight: FontWeight.bold),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CustomText(
                                                text: "دكتور ممتاز جدا",
                                                color: black,
                                                size: 20,
                                                weight: null),
                                          ],
                                        ),
                                      ),
                                       SizedBox(
                                        width: 10,
                                      ),
                                      Card(
                                        elevation: 5,
                                        color: cardBG,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: white,
                                                  borderRadius:
                                                  BorderRadius.circular(15),
                                                ),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        "assets/icons/Star_icon.svg"),
                                                    SvgPicture.asset(
                                                        "assets/icons/Star_icon.svg"),
                                                    SvgPicture.asset(
                                                        "assets/icons/Star_icon.svg"),
                                                    SvgPicture.asset(
                                                        "assets/icons/Star_icon.svg"),
                                                    const SizedBox(
                                                      width: 25,
                                                    ),
                                                    CustomText(
                                                        text: "10/10/2020",
                                                        color: black,
                                                        size: 20,
                                                        weight: null),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CustomText(
                                                align: TextAlign.start,
                                                text: "احمد سمير",
                                                color: black,
                                                size: 25,
                                                weight: FontWeight.bold),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CustomText(
                                                text: "دكتور ممتاز جدا",
                                                color: black,
                                                size: 20,
                                                weight: null),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Card(
                                        elevation: 5,
                                        color: cardBG,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: white,
                                                  borderRadius:
                                                  BorderRadius.circular(15),
                                                ),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        "assets/icons/Star_icon.svg"),
                                                    SvgPicture.asset(
                                                        "assets/icons/Star_icon.svg"),
                                                    SvgPicture.asset(
                                                        "assets/icons/Star_icon.svg"),
                                                    SvgPicture.asset(
                                                        "assets/icons/Star_icon.svg"),
                                                    const SizedBox(
                                                      width: 25,
                                                    ),
                                                    CustomText(
                                                        text: "10/10/2020",
                                                        color: black,
                                                        size: 20,
                                                        weight: null),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CustomText(
                                                align: TextAlign.start,
                                                text: "احمد سمير",
                                                color: black,
                                                size: 25,
                                                weight: FontWeight.bold),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CustomText(
                                                text: "دكتور ممتاز جدا",
                                                color: black,
                                                size: 20,
                                                weight: null),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // the stack image
                  Image.asset("assets/images/dr_pic.png"),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Container(
            color: Colors.red,
            child: TextButton(

              onPressed: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) {
                    return Reservation();
                  }));

              },
              child: CustomText(
                  text: "احجز موعد",
                  color: white,
                  size: 33,
                  weight: FontWeight.w500
              ),
            ),
          ),
        ],
      ),

    );
  }
}
