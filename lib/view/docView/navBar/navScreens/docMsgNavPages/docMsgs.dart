import 'package:HealthTracker/view/docView/navBar/navScreens/docMsgNavPages/DocPatientImages.dart';
import 'package:HealthTracker/view/docView/navBar/navScreens/docMsgNavPages/DocPatientMsg.dart';
import 'package:flutter/material.dart';

import '../../../../../constant.dart';

class DocMsgs extends StatefulWidget {
  @override
  _DocMsgsState createState() => _DocMsgsState();
}

class _DocMsgsState extends State<DocMsgs> {
  int _selected = 1;

  List screens = [ DocPatientImage(),DocPatientMsg()];

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
