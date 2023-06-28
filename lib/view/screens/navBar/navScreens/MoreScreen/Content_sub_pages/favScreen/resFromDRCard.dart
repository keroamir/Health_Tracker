import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:HealthTracker/component/DocInfoCard.dart';
import 'package:HealthTracker/component/customText.dart';
import 'package:HealthTracker/constant.dart';
import 'package:HealthTracker/view/screens/navBar/navScreens/MoreScreen/Content_sub_pages/favScreen/resFromOfferCard.dart';

class FavDocScreen extends StatefulWidget {
  const FavDocScreen({Key? key}) : super(key: key);

  @override
  State<FavDocScreen> createState() => _FavDocScreenState();
}

class _FavDocScreenState extends State<FavDocScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DocInfoCard(
                image: "assets/images/dr_pic.png",
                name: "بيتر عوني ",
                location: "المنوفية",
                price: "2000 LE",
                rating: "4.5",
                distance: "100 km",
                pro: "5555",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DocInfoCard(
                image: "assets/images/dr_pic.png",
                name: "بيتر عوني ",
                location: "المنوفية",
                price: "2000 LE",
                rating: "4.5",
                distance: "100 km",
                pro: "5555",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
