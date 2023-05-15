import 'package:flutter/material.dart';
import 'package:grad_pro/component/customText.dart';
import 'package:grad_pro/constant.dart';
class suger_Blood extends StatefulWidget {
  String? title;


  suger_Blood({this.title});

  @override
  State<suger_Blood> createState() => _suger_BloodState();
}

class _suger_BloodState extends State<suger_Blood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
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
