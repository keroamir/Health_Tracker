import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:HealthTracker/view/docView/navBar/navScreens/docHomeScreen.dart';
import 'package:HealthTracker/view/docView/navBar/navScreens/docProfileScreen.dart';
import 'package:HealthTracker/view/docView/navBar/navScreens/docMsgScreen.dart';

import '../../../constant.dart';

class DocLayoutScreen extends StatefulWidget {
  const DocLayoutScreen({Key? key}) : super(key: key);

  @override
  State<DocLayoutScreen> createState() => _DocLayoutScreenState();
}

class _DocLayoutScreenState extends State<DocLayoutScreen> {
  int _selected = 2;

  List screens = [
    DocProfileScreen(),
    DocMsgScreen(),
    DocHomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.notifications,
            color: active,
            size: 40,
          ),
          onPressed: () {},
        ),
        automaticallyImplyLeading: false,
        actions: [
          Container(
            child: Image(
              image: AssetImage("assets/logo/5.png"),
            ),
            width: MediaQuery.of(context).size.width / 2,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 10,
          ),
        ],
      ),
      body: screens[_selected],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        iconSize: 35,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedItemColor: active,
        unselectedItemColor: subText,
        backgroundColor: white,
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: subText,
        ),
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: subText,
        ),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label: 'الصفحة الشخصية',
              icon: SvgPicture.asset("assets/icons/docProfile.svg",height: MediaQuery.of(context).size.height/20,),
              activeIcon: SvgPicture.asset("assets/icons/docProfileActive.svg",height: MediaQuery.of(context).size.height/20,)),
          BottomNavigationBarItem(
              label: 'رسائل',
              icon: SvgPicture.asset(
                "assets/icons/docMsg.svg",
                height: MediaQuery.of(context).size.height / 20,
              ),
              activeIcon: SvgPicture.asset("assets/icons/docMsgActive.svg",height: MediaQuery.of(context).size.height/20,)),
          BottomNavigationBarItem(
              label: 'الرئيسية',
              icon: SvgPicture.asset(
                "assets/icons/docHome.svg",
                height: MediaQuery.of(context).size.height / 20,
              ),
              activeIcon: SvgPicture.asset(
                "assets/icons/docHomeActive.svg",
                height: MediaQuery.of(context).size.height / 20,
              )),
        ],
        currentIndex: _selected,
        onTap: (index) {
          setState(() {
            _selected = index;
          });
        },
      ),
    );
  }
}
