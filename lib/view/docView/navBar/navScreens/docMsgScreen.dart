import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HealthTracker/view/docView/navBar/navScreens/docMsgNavPages/docMsgs.dart';
import 'package:HealthTracker/view/docView/navBar/navScreens/docMsgNavPages/docTracker.dart';

import '../../../../constant.dart';

class DocMsgScreen extends StatefulWidget {
  const DocMsgScreen({Key? key}) : super(key: key);

  @override
  State<DocMsgScreen> createState() => _DocMsgScreenState();
}

class _DocMsgScreenState extends State<DocMsgScreen> {
  PageController pageController = PageController(initialPage: 1);
  int _index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
