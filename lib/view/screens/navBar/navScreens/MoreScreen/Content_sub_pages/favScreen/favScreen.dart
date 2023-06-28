import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HealthTracker/component/DocInfoCard.dart';
import 'package:HealthTracker/component/customText.dart';
import 'package:HealthTracker/constant.dart';
import 'package:HealthTracker/view/screens/navBar/navScreens/MoreScreen/Content_sub_pages/favScreen/resFromDRCard.dart';
import 'package:HealthTracker/view/screens/navBar/navScreens/MoreScreen/Content_sub_pages/favScreen/resFromOfferCard.dart';


class favScreen extends StatefulWidget {

  int _selectedIndex = 0;
  @override
  State<favScreen> createState() => _favScreenState();
}

class _favScreenState extends State<favScreen> {
  PageController pageController = PageController(initialPage: 1);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.centerRight,
          child: CustomText(
              direction: TextDirection.rtl,
              align: TextAlign.right,
              text: "المفضلة",
              color: black,
              size: 24,
              weight: FontWeight.normal),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward_ios, color: black),
            onPressed: () {
              Navigator.pop(context);
            }
          ),
          SizedBox(
            width: 15,
          ),
        ],
        elevation: 5,
        shadowColor: disabled,
        backgroundColor: white,
        automaticallyImplyLeading: false,
      ),      backgroundColor: bg,
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
                        "عروض",
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
                        "اطباء",
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
                OfferAndRegistrationScreen(),
                FavDocScreen()
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
