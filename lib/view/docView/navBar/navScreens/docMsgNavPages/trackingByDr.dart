import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:HealthTracker/view/docView/navBar/docLayoutScreen.dart';

import '../../../../../component/customText.dart';
import '../../../../../constant.dart';
import '../../../../../controller/trackController.dart';
import '../../../../../model/userModel.dart';
import 'docMsgs.dart';
import 'docTracker.dart';

class TrackingByDr extends StatefulWidget {
  const TrackingByDr({Key? key}) : super(key: key);



  @override
  State<TrackingByDr> createState() => _TrackingByDrState();
}

class _TrackingByDrState extends State<TrackingByDr> {

  PageController pageController = PageController(initialPage: 1);
  int _index = 1;

  // Method to update the row ID and refresh the data


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.centerRight,
          child: CustomText(
              direction: TextDirection.rtl,
              align: TextAlign.right,
              text: "المريض",
              color: black,
              size: 24,
              weight: FontWeight.normal),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward_ios, color: black),
            onPressed: () {
              Navigator.pop(context);
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
                      _index = 0;
                      pageController.animateToPage(
                        _index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: _index == 0 ? Colors.red : white,
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2.2,
                    child: Center(
                      child: Text(
                        "رسائل",
                        style: TextStyle(
                          color: _index == 0 ? white : black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _index = 1;
                      pageController.animateToPage(
                        _index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: _index == 1 ? Colors.red : white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2.2,
                    child: Center(
                      child: Text(
                        "تتبع",
                        style: TextStyle(
                          color: _index == 1 ? white : black,
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
                DocMsgs(),
                DocTracker(),
              ],
              onPageChanged: (_index) {
                setState(() {
                  this._index = _index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
