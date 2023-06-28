import 'package:HealthTracker/view/screens/homeSubScreens/patientImages.dart';
import 'package:HealthTracker/view/screens/homeSubScreens/patient_messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constant.dart';

class Consultation extends StatefulWidget {
  const Consultation({Key? key}) : super(key: key);

  @override
  State<Consultation> createState() => _ConsaltationState();
}

class _ConsaltationState extends State<Consultation> {
  int _selected = 1;

  List screens = [ PatientImages(),PatientMsg()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            label: 'صور',
            icon: Icon(
              Icons.image,
              color: subText,
            ),
            activeIcon: Icon(
              Icons.image,
              color: active,
            ),
          ),
          BottomNavigationBarItem(
            label: 'رسائل',
            icon: Icon(
              Icons.chat,
              color: subText,
            ),
            activeIcon: Icon(
              Icons.chat,
              color: active,
            ),
          ),
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
