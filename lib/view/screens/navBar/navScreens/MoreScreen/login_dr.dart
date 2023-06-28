import 'package:HealthTracker/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../component/customText.dart';
import '../../../../docView/navBar/docLayoutScreen.dart';

class Login_Dr extends StatefulWidget {
  const Login_Dr({Key? key}) : super(key: key);

  @override
  State<Login_Dr> createState() => _Login_DrState();
}

class _Login_DrState extends State<Login_Dr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset("assets/images/Group 1257@3x.png", fit: BoxFit.fill),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 30, left: 30, top: 100, bottom: 30),
                  child: Image(
                    image: AssetImage("assets/logo/5.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Center(
                    child: Column(
                      children: [
                        CustomText(
                            text: "تسجيل دخول طبيب",
                            color: black,
                            size: 24,
                            weight: FontWeight.bold),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: 100.0,
                          height: 2.0,
                          color: active,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: CustomText(
                      text: "الاسم",
                      color: black,
                      size: 22,
                      weight: FontWeight.normal),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Container(
                    color: bg,
                    child: TextFormField(
                      cursorColor: active,
                      maxLines: 1,
                      decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(20.0),
                        //   borderSide: BorderSide(
                        //     color: Colors.grey, // Customize the border color
                        //   ),
                        // ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors
                                .grey, // Customize the enabled border color
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: active, // Customize the focused border color
                          ),
                        ),
                        suffixIcon: Icon(Icons.person, color: active),
                        hintText: 'الاسم بالكامل',
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: subText),
                      ),
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: black,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'الرجاء ادخل اسمك';
                        }
                        return null; // Return null if the input is valid
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                // Write the number

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: CustomText(
                      text: "كلمة المرور",
                      color: black,
                      size: 22,
                      weight: FontWeight.normal),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Container(
                    color: bg,
                    child: TextFormField(
                      cursorColor: active,
                      maxLines: 1,
                      decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(20.0),
                        //   borderSide: BorderSide(
                        //     color: Colors.grey, // Customize the border color
                        //   ),
                        // ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors
                                .grey, // Customize the enabled border color
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: active, // Customize the focused border color
                          ),
                        ),
                        suffixIcon: Icon(Icons.lock, color: active),
                        hintText: 'اكتب الباسورد',
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: subText),
                      ),
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: black,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'الرجاء ادخل الباسورد';
                        }
                        return null; // Return null if the input is valid
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                // Rewrite the password

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Button action goes here
                        Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (BuildContext context) {
                          return DocLayoutScreen();
                        }), (route) => false);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(active),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ))),
                      child: Text(
                        'تسجيل',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
