import 'package:HealthTracker/view/screens/navBar/layoutScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:HealthTracker/component/customText.dart';
import 'package:HealthTracker/constant.dart';

import 'SignUp_pnt.dart';

class LoginPnt extends StatefulWidget {
  const LoginPnt({Key? key}) : super(key: key);

  @override
  State<LoginPnt> createState() => _LoginPntState();
}

class _LoginPntState extends State<LoginPnt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: SingleChildScrollView(
        child: Stack(
            children: [Image.asset("assets/images/Group 1257@3x.png", fit: BoxFit.fill),
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
                          text: "تسجيل دخول",
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
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: CustomText(
                    text: "رقم الجوال",
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
                          color:
                              Colors.grey, // Customize the enabled border color
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: active, // Customize the focused border color
                        ),
                      ),
                      suffixIcon: Icon(Icons.phone, color: active),
                      hintText: 'رقم موبايلك',
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
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(11),
                      // Limit input to 11 characters
                    ],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'الرجاء ادخل رقمك';
                      }
                      if (value.length != 11) {
                        return 'يجب ان يكون مكون من 11 رقم';
                      }
                      return null; // Return null if the input is valid
                    },
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
                          color:
                              Colors.grey, // Customize the enabled border color
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
              // Text button هل نسيت كلمة المرور
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: TextButton(
                  onPressed: () {},
                  child: CustomText(
                      text: "هل نسيت كلمة السر ؟",
                      color: active,
                      size: 20,
                      weight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Button action goes here
                      Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (BuildContext context) {
                        return LayoutScreen();
                      }), (route) => false);
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red),
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

              Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context,
                          CupertinoPageRoute(builder: (BuildContext context) {
                        return SignUpPnt();
                      }), (route) => false);
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'ليس لديك حساب؟ ',
                        style: TextStyle(
                            color: subText,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                        children: [
                          TextSpan(
                            text: 'انشأ حساب',
                            style: TextStyle(
                                color: active,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
