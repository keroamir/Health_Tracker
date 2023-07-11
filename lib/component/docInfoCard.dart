import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant.dart';
import 'customText.dart';

class DocInfoCard extends StatelessWidget {
  String image;
  String name;
  String pro;
  String location;
  String? price;
  String? rating;
  String? distance;

  DocInfoCard(
      {required this.image,
      required this.name,
      required this.pro,
      required this.location,
      this.price,
      this.rating,
      this.distance});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 30,
        shadowColor: disabled,
        color: white,
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/Mask Group 128.svg"),
                    const SizedBox(
                      width: 5,
                    ),
                    CustomText(
                        text: "5/",
                        color: subText,
                        size: 18,
                        weight: FontWeight.normal),
                    CustomText(
                        text: "$rating",
                        color: active,
                        size: 22,
                        weight: FontWeight.bold),
                  ],
                ),
                CustomText(
                  text: "$distance",
                  color: subText,
                  size: 18,
                  weight: FontWeight.normal,
                  direction: TextDirection.rtl,
                )
              ],
            ),
            Expanded(
              child: ListTile(
                title: CustomText(
                  text: name,
                  color: black,
                  size: 20,
                  weight: FontWeight.normal,
                  direction: TextDirection.rtl,
                ),
                subtitle: Directionality(
                  textDirection: TextDirection.rtl,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/Mask Group 127.svg"),
                            const SizedBox(
                              width: 5,
                            ),
                            CustomText(
                              text: pro,
                              color: black,
                              size: 18,
                              weight: FontWeight.normal,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/Mask Group 126.svg"),
                            const SizedBox(
                              width: 5,
                            ),
                            CustomText(
                              text: location,
                              color: black,
                              size: 18,
                              weight: FontWeight.normal,
                              direction: TextDirection.rtl,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/Mask Group 135.svg"),
                            const SizedBox(
                              width: 5,
                            ),
                            CustomText(
                              text: "$price",
                              color: active,
                              size: 16,
                              weight: FontWeight.bold,
                              direction: TextDirection.rtl,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 12),
              child: Image(
                image: AssetImage(image),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
