import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HealthTracker/component/customText.dart';
import 'package:HealthTracker/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../controller/trackController.dart';
import '../../../../../model/trackModel.dart';


class DocTracker extends StatefulWidget {
  const DocTracker({Key? key}) : super(key: key);

  @override
  State<DocTracker> createState() => _DocTrackerState();
}

class _DocTrackerState extends State<DocTracker> {
  TrackController _trackController = TrackController();
  Future<TrackModel?> _trackDataFuture = Future.value(null);


  @override
  void initState() {
    super.initState();
    _trackDataFuture = _trackController.getSingleRowDB(11);

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SingleChildScrollView(
          child: FutureBuilder<TrackModel?>(
            future: _trackDataFuture,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              TrackModel? trackData = snapshot.data;
              return Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 22,
                          ),
                          // first card
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: white,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            // left icons
                                            Row(
                                              children: [
                                                IconButton(
                                                    icon: Icon(Icons.call),
                                                    onPressed: () {

                                                    }
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                      20,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width /
                                                  1.9,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  CustomText(
                                      text: "بيتر عوني حبيب",
                                      color: black,
                                      size: 30,
                                      weight: null),
                                  SizedBox(height: 10),
                                  // انف و اذن
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomText(
                                          text: "انف و اذن",
                                          color: black,
                                          size: 20,
                                          weight: null),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      SvgPicture.asset("assets/icons/noseandear.svg"),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CustomText(
                                        align: TextAlign.center,
                                        text:
                                        "بيتر عوني حبيب بيتر عوني حبيب بيتر عوني حبيب بيتر عوني حبيب بيتر عوني حبيب بيتر عوني حبيب بيتر عوني حبيب بيتر عوني حبيب ",
                                        color: Colors.black26,
                                        size: 15,
                                        weight: null),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                      // the stack image
                      Image.asset("assets/images/dr_pic.png"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    //  third card
                    child: Column(
                      children: [
                        // ضغط الدم
                        CustomText(
                            text: "ضغط الدم",
                            color: black,
                            size: 33,
                            weight: FontWeight.bold),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.8,
                          height: MediaQuery.of(context).size.height / 4,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              trackData?.blood_pressure ?? "",
                              style: TextStyle(
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ),
                        // السكر
                        CustomText(
                            align: TextAlign.right,
                            direction: TextDirection.rtl,
                            text: "السكر",
                            color: black,
                            size: 33,
                            weight: FontWeight.bold),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.8,
                          height: MediaQuery.of(context).size.height / 4,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              trackData?.suger ?? "",
                              style: TextStyle(
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ),
                        // الحرارة
                        CustomText(
                            text: "الحرارة",
                            color: black,
                            size: 33,
                            weight: FontWeight.bold),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.8,
                          height: MediaQuery.of(context).size.height / 4,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  trackData?.temp ?? "",
                                  style: TextStyle(
                                    fontSize: 40,
                                  ),
                                ),
                                Text(
                                  " Normal is : 37 ",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // ضربات القلب
                        CustomText(
                            text: "ضربات القلب",
                            color: black,
                            size: 33,
                            weight: FontWeight.bold),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.8,
                          height: MediaQuery.of(context).size.height / 4,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  trackData?.heart_beat ?? "",
                                  style: TextStyle(
                                    fontSize: 40,
                                  ),
                                ),
                                Text(
                                  " Normal is  ",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "72 BPM",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    color: Colors.red,
                    child: TextButton(
                      onPressed: () {

                      },
                      child: CustomText(
                          text: "اكتب تعليق", color: white, size: 33, weight: null),
                    ),
                  ),
                ],
              );
            },
          )),
      backgroundColor: bg,
    );
  }
}
