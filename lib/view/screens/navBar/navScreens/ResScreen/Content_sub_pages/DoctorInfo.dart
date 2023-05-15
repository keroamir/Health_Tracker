import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_pro/component/customText.dart';
import 'package:grad_pro/constant.dart';

import '../../../../homeSubScreens/tracking_page_layput.dart';

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
        elevation: 0,
        backgroundColor: white,
        actions: [
          CustomText(
              text: "بيانات الطبيب", color: black, size: 33, weight: null),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: black,
              )),
        ],
      ),
      backgroundColor: bg,
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      SizedBox(
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
                                            Icon(Icons.share),
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
                                              1.9,
                                        ),
                                        // right icons
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                "assets/icons/Star_icon.svg"),
                                            SizedBox(
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
                              SizedBox(height: 15),
                              CustomText(
                                  text: "بيتر عوني حبيب",
                                  color: black,
                                  size: 30,
                                  weight: null),
                              SizedBox(height: 10),
                              // انف و اذن
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                      text: "انف و اذن",
                                      color: black,
                                      size: 20,
                                      weight: null),
                                  SizedBox(
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
                              Divider(
                                color: Colors.black38,
                                height: 6,
                                thickness: 1,
                                endIndent: 100,
                                indent: 100,
                              ),
                              SizedBox(height: 10),
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
                                  SizedBox(
                                    width: 5,
                                  ),
                                  CustomText(
                                      text: "سعر الكشف",
                                      color: black,
                                      size: 20,
                                      weight: null),
                                  SizedBox(width: 5),
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
                                      SizedBox(
                                        width: 5,
                                      ),
                                      SvgPicture.asset(
                                          "assets/icons/location_sign.svg"),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Image.asset(""),
                              Text("Location"),
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
                                            SizedBox(
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
                                              .width /
                                              5.2,
                                        ),
                                        // right part of row
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              CustomText(
                                                  text:
                                                  "(من $numOfVisitors زائر )",
                                                  color: black,
                                                  size: 20,
                                                  weight: null),
                                              SizedBox(
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
                                      ],
                                    ),
                                  ],
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
                                                    SizedBox(
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
                                            SizedBox(
                                              height: 10,
                                            ),
                                            CustomText(
                                                align: TextAlign.start,
                                                text: "احمد سمير",
                                                color: black,
                                                size: 25,
                                                weight: FontWeight.bold),
                                            SizedBox(
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
                                                    SizedBox(
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
                                            SizedBox(
                                              height: 10,
                                            ),
                                            CustomText(
                                                align: TextAlign.start,
                                                text: "احمد سمير",
                                                color: black,
                                                size: 25,
                                                weight: FontWeight.bold),
                                            SizedBox(
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
                                                    SizedBox(
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
                                            SizedBox(
                                              height: 10,
                                            ),
                                            CustomText(
                                                align: TextAlign.start,
                                                text: "احمد سمير",
                                                color: black,
                                                size: 25,
                                                weight: FontWeight.bold),
                                            SizedBox(
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
          SizedBox(height: 30,),
          Container(
            color: Colors.red,
            child: TextButton(

              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) {
                  return TrackingPage(1);
                }));
              },
              child: CustomText(
                  text: "احجز موعد",
                  color: white,
                  size: 33,
                  weight: null
              ),
            ),
          ),
        ],
      ),
    );
  }
}
