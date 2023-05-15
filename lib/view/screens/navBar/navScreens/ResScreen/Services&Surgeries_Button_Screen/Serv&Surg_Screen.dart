import 'package:flutter/material.dart';
import 'package:grad_pro/constant.dart';
import 'package:grad_pro/view/screens/navBar/layoutScreen.dart';

class Serv_Surg_Screen extends StatefulWidget {
  const Serv_Surg_Screen({Key? key}) : super(key: key);

  @override
  State<Serv_Surg_Screen> createState() => _Serv_Surg_ScreenState();
}

class _Serv_Surg_ScreenState extends State<Serv_Surg_Screen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: ListView(
        children: [
          Column(
            children: [
              LayoutScreen(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 0;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:
                            _selectedIndex == 0 ? Colors.red : white,
                          ),
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2.2,

                          child: Center(
                            child: Text(
                              "الخدمات و العمليات",
                              style: TextStyle(
                                color: _selectedIndex == 0 ? white : black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                            _selectedIndex == 1 ? Colors.red : white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2.2,

                          child: Center(
                            child: Text(
                              "مواعيدي",
                              style: TextStyle(
                                color: _selectedIndex == 1 ? white : black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
