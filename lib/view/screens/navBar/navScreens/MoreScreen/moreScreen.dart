import 'dart:io';

import 'package:HealthTracker/controller/userController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:HealthTracker/component/customText.dart';
import 'package:HealthTracker/constant.dart';
import 'package:HealthTracker/view/screens/navBar/navScreens/MoreScreen/login_pnt.dart';
import 'package:HealthTracker/view/screens/navBar/navScreens/MoreScreen/Content_sub_pages/favScreen/favScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'login_dr.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: UserController().fetchUserData(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            // print(snapshot.data.name);
            if (snapshot.data != null) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset("assets/icons/Edit_Icon.svg"),
                        Container(
                          alignment: Alignment.centerRight,
                          width: MediaQuery.of(context).size.width / 2,
                          child: ListTile(
                            title: CustomText(
                                direction: TextDirection.rtl,
                                text: (snapshot.data.data?.name != null) ? "${snapshot.data.data?.name}" : "لا يوجد",
                                color: black,
                                size: 31,
                                weight: FontWeight.w500),
                            subtitle: CustomText(
                                direction: TextDirection.rtl,
                                text: snapshot.data.data?.phone ?? "لا يوجد",
                                color: black,
                                size: 24,
                                weight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: GestureDetector(
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          String? authToken = prefs.getString('auth_token');
                          if (authToken != null) {
                             final snackBar =
                                     SnackBar(content: CustomText(text: "انت بالفعل سجلت" , color: white, size: 20, weight: FontWeight.w500,));
                                     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          } else {
                            Navigator.push(context, CupertinoPageRoute(
                                builder: (BuildContext context) {
                              return const LoginPnt();
                            }));
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 20, bottom: 10, top: 10),
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
                              SvgPicture.asset(
                                "assets/icons/person_icon.svg",
                                color: active,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(context,
                          CupertinoPageRoute(builder: (BuildContext context) {
                        return Login_Dr();
                      }), (route) => false);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 20, bottom: 10, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomText(
                                  text: "هل انت طبيب",
                                  color: Colors.grey,
                                  size: 26,
                                  weight: null),
                              SizedBox(
                                width: 10,
                              ),
                              SvgPicture.asset(
                                "assets/icons/person_icon.svg",
                                color: active,
                              ),
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
                          padding: const EdgeInsets.only(
                              right: 20, bottom: 10, top: 10),
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
                              SvgPicture.asset(
                                "assets/icons/heart_icon.svg",
                                color: active,
                              ),
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
                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //       right: 20, bottom: 10, top: 10),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.end,
                          //     children: [
                          //       CustomText(
                          //           text: "اللغه",
                          //           color: Colors.grey,
                          //           size: 26,
                          //           weight: null),
                          //       SizedBox(
                          //         width: 10,
                          //       ),
                          //       SvgPicture.asset(
                          //           "assets/icons/language_icon.svg"),
                          //     ],
                          //   ),
                          // ),
                          // Divider(
                          //   color: devider,
                          //   //color of divider
                          //   height: 5,
                          //   //height spacing of divider
                          //   thickness: 3,
                          //   //thickness of divier line
                          //   indent: 25,
                          //   //spacing at the start of divider
                          //   endIndent: 25, //spacing at the end of divider
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 20, bottom: 10, top: 10),
                            child: GestureDetector(
                              onTap: () async {
                                Uri url = Uri.parse(
                                    'http://healthtracker.frmawy.com/about');
                                _launchInBrowser(url);
                              },
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
                                  SvgPicture.asset(
                                    "assets/icons/whoIam_Icon.svg",
                                    color: active,
                                  ),
                                ],
                              ),
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
                            child: GestureDetector(
                              onTap: () {
                                Uri url = Uri.parse(
                                    "http://healthtracker.frmawy.com/contact");
                                _launchInBrowser(url);
                              },
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
                                  SvgPicture.asset(
                                    "assets/icons/telephone_icon.svg",
                                    color: active,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Divider(
                          //   color: devider,
                          //   //color of divider
                          //   height: 5,
                          //   //height spacing of divider
                          //   thickness: 3,
                          //   //thickness of divier line
                          //   indent: 25,
                          //   //spacing at the start of divider
                          //   endIndent: 25, //spacing at the end of divider
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //       right: 20, bottom: 10, top: 10),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.end,
                          //     children: [
                          //       CustomText(
                          //           text: "الشروط و الاحكام",
                          //           color: Colors.grey,
                          //           size: 26,
                          //           weight: null),
                          //       SizedBox(
                          //         width: 10,
                          //       ),
                          //       SvgPicture.asset(
                          //           "assets/icons/condition_icon.svg"),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/1.5,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(active),
                      ),
                      onPressed: ()  {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: bg,
                              elevation: 10,
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),),
                              title: Text('هل تريد تسجيل خروج', textDirection: TextDirection.rtl,style: TextStyle(color: black, fontSize: 30),),

                              actions: [
                                TextButton(
                                  child: Text('نعم',textDirection: TextDirection.rtl, style: TextStyle(color: black, fontSize: 20),),
                                  onPressed: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.remove('auth_token');
                                    exit(0);

                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              text: "تسجيل خروج",
                              color: white,
                              size: 30,
                              weight: FontWeight.w500),
                          SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset(
                            "assets/icons/signOut_icon.svg",
                            color: white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              // Handle error case
              return Text('Error: ${snapshot.error}');
            } else {
              // Show a loading indicator while waiting for the future to complete
              return const Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      ),
    );
  }
}
