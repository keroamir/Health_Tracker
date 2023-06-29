import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../../component/DoctorInfo.dart';
import '../../../../component/customText.dart';
import '../../../../constant.dart';
import 'docMsgNavPages/docMsgs.dart';

class DocHomeScreen extends StatefulWidget {
  const DocHomeScreen({Key? key}) : super(key: key);

  @override
  State<DocHomeScreen> createState() => _DocHomeScreenState();
}

class _DocHomeScreenState extends State<DocHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                CustomText(
                    text: "مواعيدي",
                    color: black,
                    size: 24,
                    weight: FontWeight.bold),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 120.0,
                  height: 2.0,
                  color: active,
                ),
              ],
            ),
          ),          Padding(
            padding: const EdgeInsets.all(10),
            // first card
            child: Column(
              children: [
                // the part above the buttons in card together
               Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Card(
                                  color: cardBG,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: CustomText(
                                        text: "الاثنين 8 يونيو 2:15 م",
                                        color: black,
                                        size: 20,
                                        weight: null),
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      CustomText(
                                          text: "بيتر عوني حبيب",
                                          color: black,
                                          size: 20,
                                          weight: null),
                                   SizedBox(height: 30,),
                                      Row(
                                        children: [
                                          CustomText(
                                              text: "الساعة",
                                              color: black,
                                              size: 20,
                                              weight: null),
                                          SizedBox(
                                            width: 5,
                                          ),
                                         Icon(Icons.date_range, color: active,),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Image.asset("assets/images/dr_pic.png"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: [
                                  CustomText(
                                      text: "اتصال",
                                      color: Colors.red,
                                      size: 25,
                                      weight: null),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(Icons.call),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              color: Colors.black,
                              //color of divider
                              width: 10,
                              //width space of divider
                              thickness: 3,
                              //thickness of divier line
                              indent: 10,
                              //Spacing at the top of divider.
                              endIndent: 10, //Spacing at the bottom of divider.
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) {
                                  return DocMsgs() ;
                                }));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Row(
                                  children: [
                                    CustomText(
                                        text: "مراسله",
                                        color: Colors.red,
                                        size: 25,
                                        weight: null),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(Icons.message),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
               Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Card(
                                  color: cardBG,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: CustomText(
                                        text: "الاثنين 8 يونيو 2:15 م",
                                        color: black,
                                        size: 20,
                                        weight: null),
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      CustomText(
                                          text: "بيتر عوني حبيب",
                                          color: black,
                                          size: 20,
                                          weight: null),
                                   SizedBox(height: 30,),
                                      Row(
                                        children: [
                                          CustomText(
                                              text: "الساعة",
                                              color: black,
                                              size: 20,
                                              weight: null),
                                          SizedBox(
                                            width: 5,
                                          ),
                                         Icon(Icons.date_range),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Image.asset("assets/images/dr_pic.png"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: [
                                  CustomText(
                                      text: "اتصال",
                                      color: Colors.red,
                                      size: 25,
                                      weight: null),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(Icons.call),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              color: Colors.black,
                              //color of divider
                              width: 10,
                              //width space of divider
                              thickness: 3,
                              //thickness of divier line
                              indent: 10,
                              //Spacing at the top of divider.
                              endIndent: 10, //Spacing at the bottom of divider.
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) {
                                  return DoctorInfoScreen() ;
                                }));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Row(
                                  children: [
                                    CustomText(
                                        text: "مراسله",
                                        color: Colors.red,
                                        size: 25,
                                        weight: null),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(Icons.message),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
