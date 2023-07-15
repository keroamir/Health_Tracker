import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:HealthTracker/component/customText.dart';
import 'package:HealthTracker/constant.dart';
import 'package:HealthTracker/view/screens/navBar/layoutScreen.dart';
import 'package:HealthTracker/view/screens/navBar/navScreens/MoreScreen/login_pnt.dart';
import 'package:http/http.dart' as http;

class SignUpPnt extends StatefulWidget {
  const SignUpPnt({Key? key}) : super(key: key);

  @override
  State<SignUpPnt> createState() => _SignUpPntState();
}

class _SignUpPntState extends State<SignUpPnt> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> registerRequest() async {
    var url = Uri.parse('http://healthtracker.frmawy.com/api/user/register');

    var data = {
      'name': '${nameController.text}',
      'fcm_token': '11',
      'email': '${emailController.text}',
      'password': '${passwordController.text}',
      'phone': '${phoneController.text}',
    };

    var response = await http.post(url, body: data);

    if (response.statusCode == 200) {
      Navigator.pushAndRemoveUntil(context,
          CupertinoPageRoute(
              builder: (BuildContext context) {
                return LayoutScreen();
              }), (route) => false);
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  }

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
                            text: "انشاء حساب",
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
                      controller: nameController,
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
                      controller: phoneController,
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
                          borderSide: const BorderSide(
                            color: Colors
                                .grey, // Customize the enabled border color
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: active, // Customize the focused border color
                          ),
                        ),
                        suffixIcon: Icon(Icons.phone, color: active),
                        hintText: 'رقم موبايلك',
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: subText),
                      ),
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
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
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: CustomText(
                      text: "البريد الألكتروني",
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
                      controller: emailController,
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
                          borderSide: const BorderSide(
                            color: Colors
                                .grey, // Customize the enabled border color
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: active, // Customize the focused border color
                          ),
                        ),
                        suffixIcon: Icon(Icons.email, color: active),
                        hintText: 'البريد الألكتروني',
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: subText),
                      ),
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: black,
                      ),
                      // keyboardType: TextInputType.text,
                      // // inputFormatters: [
                      // //   FilteringTextInputFormatter.digitsOnly,
                      // //   LengthLimitingTextInputFormatter(11),
                      // //   // Limit input to 11 characters
                      // // ],
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
                      controller: passwordController,
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
                // Rewrite the password
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: CustomText(
                      text: "اعادة كلمة المرور",
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
                      controller: confirmPasswordController,
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
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: SizedBox(
                      height: 60,
                      width: 130,
                      child: ElevatedButton(
                        onPressed: () {
                          // Button action goes here
                          registerRequest();
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.red),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                        child: Text(
                          'انشاء',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
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
                          return LoginPnt();
                        }), (route) => false);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'لديك حساب بالفعل؟ ',
                          style: TextStyle(
                              color: subText,
                              fontSize: 20,
                              fontWeight: FontWeight.normal),
                          children: [
                            TextSpan(
                              text: 'تسجيل دخول',
                              style: TextStyle(
                                  color: active,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      )),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}
