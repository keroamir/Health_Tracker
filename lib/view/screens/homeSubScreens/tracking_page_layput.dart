import 'package:HealthTracker/view/screens/homeSubScreens/consultation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HealthTracker/component/customText.dart';
import 'package:HealthTracker/constant.dart';
import 'package:HealthTracker/component/DoctorInfo.dart';

import 'tracking.dart';

class TrackingPage extends StatefulWidget {
  int index = 1;

  TrackingPage(this.index);

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  PageController pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        title: Container(
          alignment: Alignment.centerRight,
          child: CustomText(
              direction: TextDirection.rtl,
              align: TextAlign.right,
              text: "متابعة و استشارة",
              color: black,
              size: 24,
              weight: FontWeight.normal),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.notifications,
            color: active,
            size: 40,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward_ios, color: black),
            onPressed: () {
              Navigator.of(context).push(
                  CupertinoPageRoute(builder: (BuildContext context) {
                    return DoctorInfoScreen();
                  }));
            },
          ),
          SizedBox(
            width: 15,
          ),
        ],
        elevation: 5,
        shadowColor: disabled,
        backgroundColor: white,
        automaticallyImplyLeading: false,
      ),
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
                      widget.index = 0;
                      pageController.animateToPage(
                        widget.index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: widget.index == 0 ? Colors.red : white,
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2.2,
                    child: Center(
                      child: Text(
                        "استشارة",
                        style: TextStyle(
                          color: widget.index == 0 ? white : black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.index = 1;
                      pageController.animateToPage(
                        widget.index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.index == 1 ? Colors.red : white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2.2,
                    child: Center(
                      child: Text(
                        "متابعة",
                        style: TextStyle(
                          color: widget.index == 1 ? white : black,
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
               Consultation(),
                Tracking(),
              ],
              onPageChanged: (_index) {
                setState(() {
                  widget.index = _index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
