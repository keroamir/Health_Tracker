import 'package:flutter/material.dart';
import 'package:grad_pro/constant.dart';

class TwoOptionButton extends StatefulWidget {
  const TwoOptionButton({Key? key}) : super(key: key);

  @override
  _TwoOptionButtonState createState() => _TwoOptionButtonState();
}

class _TwoOptionButtonState extends State<TwoOptionButton> {
  int _selectedIndex = 0;

  // final List<Widget> _screens = [
  //   Container(color: bg),
  //   Container(color: bg),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // _screens[_selectedIndex],
          Positioned(
            top: 50,
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
                    width: MediaQuery.of(context).size.width / 2,

                    child: Center(
                      child: Text(
                        "Option 1",
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
                    width: MediaQuery.of(context).size.width / 2,

                    child: Center(
                      child: Text(
                        "Option 2",
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
        ],
      ),
    );
  }
}