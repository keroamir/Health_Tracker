import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../component/DoctorInfo.dart';
import '../../../../../component/customText.dart';
import '../../../../../constant.dart';

class Appointments extends StatefulWidget {
  const Appointments({Key? key}) : super(key: key);

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
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
                                  color: Color(0xFFEBEBEB),
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
                                SvgPicture.asset("assets/icons/resActive.svg", height: MediaQuery.of(context).size.height/18,),
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
                                    mainAxisAlignment: MainAxisAlignment.end,
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
                            color: Color(0xFFEBEBEB),
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
                          SvgPicture.asset("assets/icons/res.svg", height: MediaQuery.of(context).size.height/18,),
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
    );
  }
}
