import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:HealthTracker/controller/trackController.dart';

import '../../../component/customText.dart';
import '../../../constant.dart';
import 'tracking_page_layput.dart';

class Tracking extends StatefulWidget {
  const Tracking({Key? key}) : super(key: key);

  @override
  State<Tracking> createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  TextEditingController heartBeatController = TextEditingController();
  TextEditingController bloodPressureController = TextEditingController();
  TextEditingController sugarController = TextEditingController();
  TextEditingController tempController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                children: [
                  const SizedBox(
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
                                        const Icon(Icons.call),
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
                          const SizedBox(height: 15),
                          CustomText(
                              text: "بيتر عوني حبيب",
                              color: black,
                              size: 30,
                              weight: null),
                          const SizedBox(height: 10),
                          // انف و اذن
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                  text: "انف و اذن",
                                  color: black,
                                  size: 20,
                                  weight: null),
                              const SizedBox(
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    //  third card
                    child: Column(
                      children: [
                        TextField(
                          maxLines: 1,
                          controller: heartBeatController,
                          decoration: const InputDecoration(
                            hintText: "Heart Beat",
                            labelStyle: TextStyle(color: active),
                            labelText: "Heart Beat",
                            fillColor: white,
                            helperStyle: TextStyle(color: subText),
                            contentPadding: EdgeInsets.all(8),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: subText, width: 0.5)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: subText, width: 0.5)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: subText, width: 0.5)),
                          ),
                        ),
                        TextField(
                          maxLines: 1,
                          controller: bloodPressureController,
                          decoration: const InputDecoration(
                            hintText: "Blood Pressure",
                            labelStyle: TextStyle(color: active),
                            labelText: "Blood Pressure",
                            fillColor: white,
                            helperStyle: TextStyle(color: subText),
                            contentPadding: EdgeInsets.all(8),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: subText, width: 0.5)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: subText, width: 0.5)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: subText, width: 0.5)),
                          ),
                        ),
                        TextField(
                          maxLines: 1,
                          controller: sugarController,
                          decoration: const InputDecoration(
                            hintText: "Sugar",
                            labelStyle: TextStyle(color: active),
                            labelText: "Sugar",
                            fillColor: white,
                            helperStyle: TextStyle(color: subText),
                            contentPadding: EdgeInsets.all(8),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: subText, width: 0.5)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: subText, width: 0.5)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: subText, width: 0.5)),
                          ),
                        ),
                        TextField(
                          maxLines: 1,
                          controller: tempController,
                          decoration: const InputDecoration(
                            hintText: "Temperature",
                            labelStyle: TextStyle(color: active),
                            labelText: "Temperature",
                            fillColor: white,
                            helperStyle: TextStyle(color: subText),
                            contentPadding: EdgeInsets.all(8),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: subText, width: 0.5)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: subText, width: 0.5)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide(color: subText, width: 0.5)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // the stack image
              Image.asset("assets/images/dr_pic.png"),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            color: Colors.red,
            child: TextButton(
              onPressed: () {

              },
              child: CustomText(
                  text: "اكتب استشارة", color: white, size: 33, weight: null),
            ),
          ),
        ],
      ),
    );
  }
}
