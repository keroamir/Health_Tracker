import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_pro/component/customText.dart';
import 'package:grad_pro/constant.dart';
import 'package:grad_pro/view/screens/navBar/navScreens/MoreScreen/Content_sub_pages/favScreen/favScreen.dart';

import 'login_dr.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("assets/icons/Edit_Icon.svg"),
                    Column(
                      children: [
                        CustomText(
                            text: "بيتر عوني",
                            color: black,
                            size: 31,
                            weight: null),
                        CustomText(
                            text: "01279989934",
                            color: black,
                            size: 24,
                            weight: null),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (BuildContext context) {
                        return Login_Dr();
                      }), (route) => false);
                    },
                    child: Padding(
                      padding:
                      const EdgeInsets.only(right: 20, bottom: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomText(
                              text: "تسجيل دخول",
                              color: Colors.grey,
                              size: 26,
                              weight: null),
                          SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset("assets/icons/person_icon.svg"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (BuildContext context) {
                          return favScreen();
                        }));
                  },
                  child: Card(
                    child: Padding(
                      padding:
                      const EdgeInsets.only(right: 20, bottom: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomText(
                              text: "المفضلة",
                              color: Colors.grey,
                              size: 26,
                              weight: null),
                          SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset("assets/icons/heart_icon.svg"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20, bottom: 10, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomText(
                                text: "اللغه",
                                color: Colors.grey,
                                size: 26,
                                weight: null),
                            SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset("assets/icons/language_icon.svg"),
                          ],
                        ),
                      ),
                      Divider(
                        color: devider,
                        //color of divider
                        height: 5,
                        //height spacing of divider
                        thickness: 3,
                        //thickness of divier line
                        indent: 25,
                        //spacing at the start of divider
                        endIndent: 25, //spacing at the end of divider
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20, bottom: 10, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomText(
                                text: "من نحن",
                                color: Colors.grey,
                                size: 26,
                                weight: null),
                            SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset("assets/icons/whoIam_Icon.svg"),
                          ],
                        ),
                      ),
                      Divider(
                        color: devider,
                        //color of divider
                        height: 5,
                        //height spacing of divider
                        thickness: 3,
                        //thickness of divier line
                        indent: 25,
                        //spacing at the start of divider
                        endIndent: 25, //spacing at the end of divider
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20, bottom: 10, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomText(
                                text: "اتصل بنا",
                                color: Colors.grey,
                                size: 26,
                                weight: null),
                            SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset("assets/icons/telephone_icon.svg"),
                          ],
                        ),
                      ),
                      Divider(
                        color: devider,
                        //color of divider
                        height: 5,
                        //height spacing of divider
                        thickness: 3,
                        //thickness of divier line
                        indent: 25,
                        //spacing at the start of divider
                        endIndent: 25, //spacing at the end of divider
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20, bottom: 10, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomText(
                                text: "الشروط و الاحكام",
                                color: Colors.grey,
                                size: 26,
                                weight: null),
                            SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset("assets/icons/condition_icon.svg"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {

                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        text: "تسجيل خروج ", color: black, size: 40, weight: null),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset("assets/icons/signOut_icon.svg"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
