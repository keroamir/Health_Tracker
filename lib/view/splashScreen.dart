import 'package:flutter/material.dart';
import 'package:HealthTracker/view/screens/navBar/layoutScreen.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image(
        image: const AssetImage("assets/logo/3.png"),
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 4,
      ),
      backgroundImage: const Image(
        image: AssetImage("assets/images/Group1.png"),
        color: Colors.white,
      ).image,
      showLoader: false,
      durationInSeconds: 3,
      navigator: const LayoutScreen(),
    );
  }
}
