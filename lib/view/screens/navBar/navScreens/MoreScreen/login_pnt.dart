import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:HealthTracker/view/screens/navBar/layoutScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:HealthTracker/component/customText.dart';
import 'package:HealthTracker/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../controller/authController.dart';
import '../../../../../model/ProgressHUD.dart';
import '../../../../../model/authModel.dart';
import 'SignUp_pnt.dart';

class LoginPnt extends StatefulWidget {
  const LoginPnt({Key? key}) : super(key: key);

  @override
  State<LoginPnt> createState() => _LoginPntState();
}

class _LoginPntState extends State<LoginPnt> {
  bool hidePassword = true;

  // bool isApiCallProcess = false;
  // GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  // late LoginRequestModel loginRequestModel;
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  //
  // @override
  // void initState() {
  //   super.initState();
  //   loginRequestModel = new LoginRequestModel();
  // }

  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> loginUser() async {
    String phone = _phoneController.text.trim();
    String password = _passwordController.text.trim();

    // Make a POST request to the login API endpoint
    var response = await http.post(
      Uri.parse('http://healthtracker.frmawy.com/api/user/login'),
      body: {
        'fcm_token': 'sasdasdasdas',
        'phone': phone,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      print("$phone , $password");
      // Login successful
      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse['data'] != null &&
          jsonResponse['data']['token'] != null) {
        String authToken = jsonResponse['data']['token'];

        // Store the session token securely using shared_preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', authToken);

        // Navigate to the main screens of your app
        Navigator.pushAndRemoveUntil(context,
            CupertinoPageRoute(builder: (BuildContext context) {
          return LayoutScreen();
        }), (route) => false);
      } else {
        // Invalid response format
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Login Error'),
              content: Text('Invalid response format.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } else {
      // Login failed
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Error'),
            content: Text('Invalid phone number or password.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    print(response.body);
  }

  // @override
  // Widget build(BuildContext context) {
  //   return ProgressHUD(
  //     child: _uiSetup(context),
  //     inAsyncCall: isApiCallProcess,
  //     opacity: 0.3,
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: SingleChildScrollView(
        child: Stack(children: [
          Image.asset("assets/images/Group 1257@3x.png", fit: BoxFit.fill),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(right: 30, left: 30, top: 100, bottom: 30),
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
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: CustomText(
                        text: "رقم الجوال",
                        direction: TextDirection.rtl,
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
                        controller: _phoneController,
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
                              color:
                                  active, // Customize the focused border color
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
                        // onSaved: (input) =>
                        // loginRequestModel.phone = input,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
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
                        controller: _passwordController,
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
                              color:
                                  active, // Customize the focused border color
                            ),
                          ),
                          prefixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            color: active.withOpacity(0.4),
                            icon: Icon(hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility),
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
                        keyboardType: TextInputType.text,
                        // onSaved: (input) =>
                        // loginRequestModel.password = input,

                        obscureText: hidePassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'الرجاء ادخل الباسورد';
                          }
                          return null; // Return null if the input is valid
                        },
                      ),
                    ),
                  ),
                ],
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
                      loginUser();
                      // if (validateAndSave()) {
                      //   print(loginRequestModel.toJson());
                      //
                      //   setState(() {
                      //     isApiCallProcess = true;
                      //   });
                      //
                      //   APIService apiService = new APIService();
                      //   apiService.login(loginRequestModel).then((value) {
                      //     if (value != null) {
                      //       setState(() {
                      //         isApiCallProcess = false;
                      //       });
                      //
                      //       if (value.token!.isNotEmpty) {
                      //         final snackBar =
                      //         SnackBar(content: CustomText(text: "Login Successful" , color: white, size: 20, weight: FontWeight.w500,));
                      //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      //       } else {
                      //         final snackBar =
                      //         SnackBar(content: Text(value.error));
                      //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      //       }
                      //     }
                      //   });
                      // }

                      // Button action goes here
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

// bool validateAndSave() {
//   final form = globalFormKey.currentState;
//   if (form!.validate()) {
//     form.save();
//     return true;
//   }
//   return false;
// }
}
