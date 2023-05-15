import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad_pro/component/customText.dart';
import 'package:grad_pro/constant.dart';
import 'package:grad_pro/view/docView/navBar/navScreens/docMsgNavPages/biometricPage.dart';

class heart_beating extends StatefulWidget {
  String? title;

  heart_beating({this.title});

  @override
  State<heart_beating> createState() => _heart_beatingState();
}

class _heart_beatingState extends State<heart_beating> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.centerRight,
          child: CustomText(
              direction: TextDirection.rtl,
              align: TextAlign.right,
              text: (widget.title == null )? "حجز عيادة" : "${widget.title}",
              color: black,
              size: 24,
              weight: FontWeight.normal),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward_ios, color: black),
            onPressed: () {
              Navigator.of(context).push(
                  CupertinoPageRoute(builder: (BuildContext context) {
                    return BioMetric();
                  }));
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
    );
  }
}
