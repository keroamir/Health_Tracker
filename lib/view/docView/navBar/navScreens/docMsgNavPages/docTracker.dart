import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HealthTracker/component/customText.dart';
import 'package:HealthTracker/constant.dart';
import 'package:HealthTracker/view/docView/navBar/navScreens/docMsgNavPages/trackingByDr.dart';


class DocTracker extends StatefulWidget {
  const DocTracker({Key? key}) : super(key: key);

  @override
  State<DocTracker> createState() => _DocTrackerState();
}

class _DocTrackerState extends State<DocTracker> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: bg,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) {
                      return TrackingByDr();
                    }));
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex : 2,
                          child: ListTile(
                              title: CustomText(text: "الاسم : كيرلس امير", color: black, size: 20, weight: FontWeight.w600, direction: TextDirection.rtl,),
                              subtitle: CustomText(text: 'السن : 23', color: black , size: 16, weight: FontWeight.w500,direction: TextDirection.rtl,),
                            ),

                        ),

                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0, top: 8, bottom: 8,left: 12),
                            child: Image(
                              image: NetworkImage("https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/v937-aew-139.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=df5cf03ba78dce75d913bb39d9e75a93"),
                              height: MediaQuery.of(context).size.height / 8,
                              width: MediaQuery.of(context).size.width / 4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
