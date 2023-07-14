import 'package:HealthTracker/component/DoctorInfo.dart';
import 'package:HealthTracker/view/screens/homeSubScreens/tracking_page_layput.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../component/customText.dart';
import '../../../constant.dart';

class Reservation extends StatefulWidget {
  const Reservation({Key? key}) : super(key: key);

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  List<String> _availableDays = [
    'الاثنين',
    'الثلاثاء',
    'الاربعاء',
    'الخميس',
    'الجمعة'
  ];
  List<String> _availableTimes = [
    '9 صباحاً',
    '1 ظهراً',
    '3 عصراً',
    '6 مساءً',
  ];

  String? _selectedDay;
  String? _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedDay = _availableDays[0];
    _selectedTime = _availableTimes[0];
  }

  Widget _buildDropdownButton(
      List<String> items, String value, Function(String?) onChanged) {
    return DropdownButton<String>(
      value: value,
      onChanged: onChanged,
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }

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
              text: "حجز موعد",
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
                return DoctorInfoScreen();
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'اختر يوم',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              _buildDropdownButton(_availableDays, _selectedDay!,
                  (String? newValue) {
                setState(() {
                  _selectedDay = newValue;
                });
              }),
              SizedBox(height: 16.0),
              Text(
                'اختر الوقت',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              _buildDropdownButton(_availableTimes, _selectedTime!,
                  (String? newValue) {
                setState(() {
                  _selectedTime = newValue;
                });
              }),
              SizedBox(height: 24.0),
              ElevatedButton(
                style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(active),
              ),
                onPressed: () {
                  // Perform reservation logic
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('تم تاكيد الحجز', textDirection: TextDirection.rtl,),
                        content: Text(
                            'لقد حجزت بنحاح موعدك يوم $_selectedDay الساعة $_selectedTime ', textDirection: TextDirection.rtl,),
                        actions: [
                          TextButton(
                            child: Text('تم',textDirection: TextDirection.rtl,),
                            onPressed: () {
                             Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (BuildContext context) {
                               return TrackingPage(1);
                             }), (route) => false);

                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('احجز', textDirection: TextDirection.rtl,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
