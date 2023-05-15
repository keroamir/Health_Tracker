import 'package:flutter/material.dart';
import 'package:grad_pro/component/customText.dart';
import 'package:grad_pro/constant.dart';
class blood_pressure extends StatefulWidget {
  String? title;


  blood_pressure({this.title});
  @override
  State<blood_pressure> createState() => _blood_pressureState();
}

class _blood_pressureState extends State<blood_pressure> {
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
