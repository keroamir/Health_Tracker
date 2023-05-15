import 'package:flutter/material.dart';
import 'package:grad_pro/component/customText.dart';
import 'package:grad_pro/constant.dart';
class temperature extends StatefulWidget {
  String? title;


  temperature({this.title});

  @override
  State<temperature> createState() => _temperatureState();
}

class _temperatureState extends State<temperature> {
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
      ),
      backgroundColor: bg,
    );
  }
}
