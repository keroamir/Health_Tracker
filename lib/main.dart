import 'package:flutter/material.dart';
import 'package:grad_pro/component/buttons.dart';
import 'package:grad_pro/view/docView/navBar/docLayoutScreen.dart';
import 'package:grad_pro/view/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Care',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      //TwoOptionButton(),
    );
  }
}

