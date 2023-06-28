import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:HealthTracker/component/buttons.dart';
import 'package:HealthTracker/component/customText.dart';
import 'package:HealthTracker/constant.dart';
import 'package:HealthTracker/component/DoctorInfo.dart';
import 'package:HealthTracker/view/screens/navBar/navScreens/ResScreen/Serv&Surg_Screen.dart';
import 'package:HealthTracker/view/screens/navBar/navScreens/ResScreen/appointment.dart';

class ResScreen extends StatefulWidget {
  int _selectedIndex = 0;

  ResScreen(this._selectedIndex);

  @override
  State<ResScreen> createState() => _ResScreenState();
}

class _ResScreenState extends State<ResScreen> {
  PageController pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget._selectedIndex = 0;
                      pageController.animateToPage(
                        widget._selectedIndex,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: widget._selectedIndex == 0 ? Colors.red : white,
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2.2,
                    child: Center(
                      child: Text(
                        "الخدمات و العمليات",
                        style: TextStyle(
                          color: widget._selectedIndex == 0 ? white : black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget._selectedIndex = 1;
                      pageController.animateToPage(
                        widget._selectedIndex,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget._selectedIndex == 1 ? Colors.red : white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2.2,
                    child: Center(
                      child: Text(
                        "مواعيدي",
                        style: TextStyle(
                          color: widget._selectedIndex == 1 ? white : black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                Serv_Surg_Screen(),
                Appointments(),
              ],
              onPageChanged: (_index) {
                setState(() {
                  widget._selectedIndex = _index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
