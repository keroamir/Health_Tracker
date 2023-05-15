import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad_pro/component/customText.dart';
import 'package:grad_pro/constant.dart';

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
      backgroundColor: bg,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
            height: 500,
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [

                TextField(
                  decoration: InputDecoration(
                      hintText: "Enter Username Here",
                      labelText: "Username"
                  ),
                ),

                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Enter Password Here",
                      labelText: "Password"
                  ),
                ),

                Padding( // on pressed go to dr page
                  padding: const EdgeInsets.all(20.0),
                    child: Container(
                      color: Colors.green,
                      child: TextButton(

                        onPressed: () {
                          Navigator.push(context,
                              CupertinoPageRoute(builder: (BuildContext context) {
                                return DocLayoutScreen();
                              }));
                        },
                        child: CustomText(
                            text: "Sign In ",
                            color: white,
                            size: 33,
                            weight: null
                        ),
                      ),
                    ),

                ),
              ],
            )
        ),
      ),

    );
  }
}
