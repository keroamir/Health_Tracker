import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad_pro/constant.dart';
import '../../../../../component/Doc_departmentGridCard}Custom.dart';
import '../../../../../component/customText.dart';
import '../../docLayoutScreen.dart';
class BioMetric extends StatefulWidget {
  const BioMetric({Key? key}) : super(key: key);

  @override
  State<BioMetric> createState() => _BioMetricState();
}

class _BioMetricState extends State<BioMetric> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Container(
          alignment: Alignment.centerRight,
          child: CustomText(
              direction: TextDirection.rtl,
              align: TextAlign.right,
              text: "قراءات",
              color: black,
              size: 24,
              weight: FontWeight.normal),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward_ios, color: black),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  CupertinoPageRoute(builder: (BuildContext context) {
                    return DocLayoutScreen();
                  }), (Route<dynamic> route) => false);
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
       body:
       Column(
         children: [
           // image
           // name
           // age
           GridView.extent(
             maxCrossAxisExtent: 300,
             shrinkWrap: true,
             padding: EdgeInsets.symmetric(horizontal: 28, vertical: 20),
             crossAxisSpacing: 20,
             mainAxisSpacing: 100,
             children: [
               Doc_departmentGridCard(
                   text: "نبض الفلب", image: "assets/images/heart-beating.png"),
               Doc_departmentGridCard(
                   text: "السكر", image: "assets/images/sugar-blood-level.png"),
               Doc_departmentGridCard(
                   text: "درجة الحراره", image: "assets/images/temperature.png"),
               Doc_departmentGridCard(
                  text: "ضغط الدم", image: "assets/images/blood-pressure.png"),
            ],
           ),
         ],
       ),
    );
  }
}
