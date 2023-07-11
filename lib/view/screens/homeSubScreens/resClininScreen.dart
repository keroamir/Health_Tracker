import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HealthTracker/component/customText.dart';
import 'package:HealthTracker/component/resClinicCard.dart';
import 'package:HealthTracker/view/screens/navBar/layoutScreen.dart';

import '../../../constant.dart';

// ignore: must_be_immutable
class ResClinicScreen extends StatefulWidget {
  String? title;


  ResClinicScreen({super.key, this.title});

  @override
  State<ResClinicScreen> createState() => _ResClinicScreenState();
}

class _ResClinicScreenState extends State<ResClinicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
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
            icon: const Icon(Icons.arrow_forward_ios, color: black),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  CupertinoPageRoute(builder: (BuildContext context) {
                return const LayoutScreen();
              }), (Route<dynamic> route) => false);
            },
          ),
          const SizedBox(
            width: 15,
          ),
        ],
        elevation: 5,
        shadowColor: disabled,
        backgroundColor: white,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                color: bg),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: TextFormField(
                style: const TextStyle(
                  fontSize: 16,
                  color: black,
                  fontWeight: FontWeight.w500,
                ),
                textDirection: TextDirection.rtl,
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "بحث عن تخصص",
                  fillColor: white,
                  filled: true,
                  hintStyle: const TextStyle(
                    fontSize: 20,
                  ),
                  hintTextDirection: TextDirection.rtl,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  border: OutlineInputBorder(
                    gapPadding: 3,
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: subText,
                  ),
                ),
              ),
            ),
          ),
          Directionality(
            
            textDirection: TextDirection.rtl,
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 15,
              children: [
                ResClinicCrad(
                    image:
                    "assets/images/lady-with-plaster-nose-doctor-examining-patients-face-after-plastic-surgery_124865-2570.png",
                    name: "أنف وأذن"),

                ResClinicCrad(
                    image:
                        "assets/images/gynecologist-doctor-consulting-patient-using-uterus-anatomy-model_130111-1800.png",
                    name: "باطنة"),
                ResClinicCrad(
                    image:
                    "assets/images/man-sitting-psychologist-s-office-talking-about-problems_1157-28351.png",
                    name: "نفسيه"),

                ResClinicCrad(
                    image:
                        "assets/images/african-american-traumatologist-isolated-whitewall-giving-thumbs-up-gesture_1368-113802.png",
                    name: "عظام"),
                ResClinicCrad(image: "assets/images/woman-patient-dentist_1303-9364.png", name: "اسنان"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
