import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_pro/component/customText.dart';
import 'package:grad_pro/constant.dart';

class offerAndRegestrationScreen extends StatefulWidget {
  const offerAndRegestrationScreen({Key? key}) : super(key: key);

  @override
  State<offerAndRegestrationScreen> createState() =>
      _offerAndRegestrationScreenState();
}

class _offerAndRegestrationScreenState
    extends State<offerAndRegestrationScreen> {
  int pageIndex = 0;

  List<Widget> _demo = [
    Image.asset("assets/images/dentist.png"),
    Image.asset("assets/images/dentist.png"),
    Image.asset("assets/images/dentist.png"),
    Image.asset("assets/images/dentist.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        actions: [
          CustomText(text: "المفضله", color: black, size: 33, weight: null),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: black,
              )),
        ],
      ),
      backgroundColor: bg,
      body: Padding(
        padding: const EdgeInsets.only(top: 5
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 150,
                      width: double.infinity,
                      child: PageView(
                        children: _demo,
                        onPageChanged: (index) {
                          setState(() {
                            pageIndex = index;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    CarouselIndicator(
                      count: _demo.length,
                      index: pageIndex,
                    ),
                  ],
                ),
                // Padding(
                //   padding: const EdgeInsets.all(15),
                //   child: Image.asset("assets/images/dentist.png"),
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 110,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      color: white,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: CustomText(
                                    text: "عرض عملية لتجميل الاسنان",
                                    color: black,
                                    size: 20,
                                    weight: null),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // حجز button
                              Container(
                                height: 50,
                                width: 100,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                  onPressed: () {},
                                  child: CustomText(
                                      text: "حجز",
                                      color: white,
                                      size: 20,
                                      weight: null),
                                ),
                              ),
                              // offer row
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    CustomText(
                                      text: "100 LE",
                                      color: active,
                                      size: 16,
                                      weight: FontWeight.bold,
                                      direction: TextDirection.rtl,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    SvgPicture.asset("assets/icons/offer_icon.svg"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // sale text
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 115,
                    horizontal: 30,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CustomText(
                          text: "-30%", color: white, size: 15, weight: null),
                    ),
                  ),
                ),
                // doc pic and name and rate
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 5),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/icons/Star_icon.svg"),
                          SizedBox(
                            width: 5,
                          ),
                          CustomText(
                              text: "5/",
                              color: subText,
                              size: 18,
                              weight: FontWeight.normal),
                          CustomText(
                              text: "4.7",
                              color: active,
                              size: 22,
                              weight: FontWeight.bold),
                        ],
                      ),
                    ),
                    CustomText(
                        text: "بيتر عوني", color: black, size: 25, weight: null),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2.3,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset("assets/images/dr_pic.png"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
