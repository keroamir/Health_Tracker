import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HealthTracker/component/customText.dart';
import 'package:HealthTracker/component/gridCard.dart';
import 'package:HealthTracker/view/screens/homeSubScreens/resClininScreen.dart';

import '../../../../../constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            color: bg),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CarouselSlider(
                    items: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset("assets/images/1.png",
                            fit: BoxFit.fill),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset("assets/images/2.png",
                            fit: BoxFit.fill),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset("assets/images/3.png",
                            fit: BoxFit.fill),
                      ),
                    ],
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height / 5,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 300),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10, top: 10),
                          child: CustomText(
                            text: "الاقسام",
                            color: black,
                            size: 24,
                            weight: FontWeight.bold,
                            direction: TextDirection.rtl,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(
                                builder: (BuildContext context) {
                              return ResClinicScreen();
                            }));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
                            shadowColor: disabled,
                            color: white,
                            child: ListTile(
                              title: CustomText(
                                text:  "حجز عيادة",
                                color: black,
                                size: 22,
                                weight: FontWeight.normal,
                                direction: TextDirection.rtl,
                              ),
                              subtitle: SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 2 / 3,
                                child: CustomText(
                                  text:
                                      "يمكنك الان حجز موعد مع الدكتور \n بسرعة وسهولة",
                                  color: subText,
                                  size: 18,
                                  weight: FontWeight.normal,
                                  direction: TextDirection.rtl,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                   const Positioned(
                      left: 5,
                      bottom: 5,
                      child: Image(
                        image: AssetImage("assets/images/doctor.png"),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
                GridView.count(
                  primary: false,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: [
                    GridCard(
                        text: "خدمة أو عملية", image: "assets/images/22.png"),
                    GridCard(
                        text: "مستشفي", image: "assets/images/11.png"),
                    GridCard(
                        text: "صيدلية", image: "assets/images/44.png"),
                    GridCard(
                        text: "زيارة منزلية", image: "assets/images/33.png"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
