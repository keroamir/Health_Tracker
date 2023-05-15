import 'package:flutter/material.dart';
import 'package:grad_pro/component/docInfoCard.dart';
import 'package:grad_pro/component/searchBar.dart';

import '../../../../constant.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            color: bg),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: SearchBar(),
            ),
            DocInfoCard(image: "assets/images/3485318.png", name: "محمود جمال الكومي", pro: "انف واذن", location: "الرياض / شارع الجامعة", price: "200 ريال", rating: "4.7", distance: "10 كم"),
            DocInfoCard(image: "assets/images/12346.png", name: "هشام إبراهيم التطاوي", pro: "انف واذن", location: "مكة / شارع الملك", price: "110 ريال", rating: "4.9", distance: "186 كم")
          ],
        ),
      ),
    );
  }
}
