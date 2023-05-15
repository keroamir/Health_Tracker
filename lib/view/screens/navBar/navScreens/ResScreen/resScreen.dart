import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_pro/component/buttons.dart';
import 'package:grad_pro/component/customText.dart';
import 'package:grad_pro/constant.dart';
import 'package:grad_pro/view/screens/navBar/navScreens/ResScreen/Content_sub_pages/DoctorInfo.dart';
import 'package:grad_pro/view/screens/navBar/navScreens/ResScreen/Services&Surgeries_Button_Screen/Serv&Surg_Screen.dart';


class ResScreen extends StatefulWidget {
  const ResScreen({Key? key}) : super(key: key);

  @override
  State<ResScreen> createState() => _ResScreenState();
}

class _ResScreenState extends State<ResScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bg,
        body: ListView(
          children: [
            Column(
              children: [
                // Switch buttons
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = 0;
                            });
                            Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) {
                              return Serv_Surg_Screen();
                            }));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:
                              _selectedIndex == 0 ? Colors.red : white,
                            ),
                            height: 50,
                            width: MediaQuery.of(context).size.width / 2.2,

                            child: Center(
                              child: Text(
                                    "الخدمات و العمليات",
                                style: TextStyle(
                                  color: _selectedIndex == 0 ? white : black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = 1;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                              _selectedIndex == 1 ? Colors.red : white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 50,
                            width: MediaQuery.of(context).size.width / 2.2,

                            child: Center(
                              child: Text(
                                "مواعيدي",
                                style: TextStyle(
                                  color: _selectedIndex == 1 ? white : black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  // first card
                  child: Card(
                    child: Column(
                      children: [
                        // the part above the buttons in card together
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) {
                              return DoctorInfoScreen() ;
                            }));
                          },
                          child: Card(
                            elevation: 0,
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Card(
                                          color: subText,
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
                                        SvgPicture.asset("assets/icons/red_Icon.svg"),
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
                                              Row(
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
                                              Row(
                                                children: [
                                                  CustomText(
                                                      text: "العنوان",
                                                      color: black,
                                                      size: 20,
                                                      weight: null),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  SvgPicture.asset(
                                                      "assets/icons/location_sign.svg"),
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
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade200,
                          //color of divider
                          height: 5,
                          //height spacing of divider
                          thickness: 3,
                          //thickness of divier line
                          indent: 25,
                          //spacing at the start of divider
                          endIndent: 25, //spacing at the end of divider
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    CustomText(
                                        text: "الغاء",
                                        color: Colors.red,
                                        size: 25,
                                        weight: null),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    SvgPicture.asset(
                                        "assets/icons/Exit_icon.svg"),
                                  ],
                                ),
                              ),
                            ),
                            VerticalDivider(
                              color: Colors.red,
                              //color of divider
                              width: 10,
                              //width space of divider
                              thickness: 10,
                              //thickness of divier line
                              indent: 10,
                              //Spacing at the top of divider.
                              endIndent: 10, //Spacing at the bottom of divider.
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: [
                                  CustomText(
                                      text: "تغيير",
                                      color: Colors.red,
                                      size: 25,
                                      weight: null),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SvgPicture.asset(
                                      "assets/icons/change_icon.svg"),
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
                                        text: "عرض",
                                        color: Colors.red,
                                        size: 25,
                                        weight: null),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    SvgPicture.asset(
                                        "assets/icons/offer_icon.svg"),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  // second card
                  child: Card(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Card(
                                  color: subText,
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
                                SvgPicture.asset("assets/icons/red_Icon.svg"),
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
                                      Row(
                                        children: [
                                          CustomText(
                                              text: "عظام",
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Image.asset("assets/images/face_image.png"),
                          ],
                        ),
                        Divider(
                          color: Colors.grey.shade200,
                          //color of divider
                          height: 5,
                          //height spacing of divider
                          thickness: 3,
                          //thickness of divier line
                          indent: 25,
                          //spacing at the start of divider
                          endIndent: 25, //spacing at the end of divider
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: [
                                  CustomText(
                                      text: "الغاء",
                                      color: Colors.red,
                                      size: 25,
                                      weight: null),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SvgPicture.asset(
                                      "assets/icons/Exit_icon.svg"),
                                ],
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
