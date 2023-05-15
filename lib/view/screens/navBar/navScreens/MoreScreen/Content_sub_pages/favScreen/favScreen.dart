import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad_pro/component/DocInfoCard.dart';
import 'package:grad_pro/component/customText.dart';
import 'package:grad_pro/constant.dart';
import 'package:grad_pro/view/screens/navBar/navScreens/MoreScreen/Content_sub_pages/favScreen/resFromDRCard.dart';


class favScreen extends StatefulWidget {
  const favScreen({Key? key}) : super(key: key);

  @override
  State<favScreen> createState() => _favScreenState();
}

class _favScreenState extends State<favScreen> {
  //   List<Widget> buttons = <Widget>[
  //     CustomText(
  //   text: "text",
  //   color: black,
  //   size: 33,
  //   weight: null
  //   ),
  //     Text('عرض'),
  //  ];
  // final List<bool> _selectedbuttons = <bool>[true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        actions: [
          CustomText(text: "المفضله", color: black, size: 33, weight: null),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: black,
              )),
        ],
      ),
      backgroundColor: bg,
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              // ToggleButtons(
              //
              //     borderWidth: 5,
              //     onPressed: (int index) {
              //       setState(() {
              //         // The button that is tapped is set to true, and the others to false.
              //         for (int i = 0; i < _selectedbuttons.length; i++) {
              //           if(buttons[index] == 1){
              //             Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) {
              //               return fav_res_Screen() ;
              //             } ));}
              //
              //           _selectedbuttons[i] = i == index;
              //         }
              //
              //       });
              //
              //
              //     },
              //     borderRadius: const BorderRadius.all(Radius.circular(8)),
              //     selectedBorderColor: Colors.red[700],
              //     selectedColor: Colors.white,
              //     fillColor: Colors.red[400],
              //     color: black,
              //     constraints: const BoxConstraints(
              //       minHeight: 40.0,
              //       minWidth: 80.0,
              //     ),
              //     isSelected: _selectedbuttons,
              //     children: buttons,
              //   ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: InkWell(
                          onTap: () {

                            Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) {
                              return fav_res_Screen() ;
                            } ));
                          },
                          child: CustomText(
                              text: "عرض",
                              color: black,
                              size: 33,
                              weight: null),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: CustomText(
                              text: "اطباء",
                              color: black,
                              size: 33,
                              weight: null),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Card(
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(50),
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       children: [
              //         TextButton(
              //             onPressed: () {
              //               Navigator.push(context,CupertinoPageRoute(builder: (BuildContext context) {
              //                 return fav_res_Screen();
              //               }));
              //             },
              //             style: ButtonStyle(
              //               fixedSize:
              //                   MaterialStateProperty.all<Size?>(Size(180, 60)),
              //               backgroundColor:
              //                   MaterialStateProperty.resolveWith<Color>(
              //                 (Set<MaterialState> states) {
              //                   if (states.contains(MaterialState.pressed))
              //                     return Colors.red;
              //                   return Colors.white;
              //                 },
              //               ),
              //               shape: MaterialStateProperty.all(
              //                 RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(30),
              //                 ),
              //               ),
              //             ),
              //             child: CustomText(
              //               text: 'عرض',
              //               color: black,
              //               size: 26,
              //               weight: null,
              //             )),
              //         TextButton(
              //             onPressed: () {
              //               Navigator.push(context,CupertinoPageRoute(builder: (BuildContext context) {
              //                 return favScreen();
              //               }));
              //             },
              //             style: ButtonStyle(
              //               backgroundColor:
              //                   MaterialStateProperty.resolveWith<Color>(
              //                 (Set<MaterialState> states) {
              //                   if (states.contains(MaterialState.pressed))
              //                     return Colors.red;
              //                   return Colors.white;
              //                 },
              //               ),
              //               fixedSize:
              //                   MaterialStateProperty.all<Size?>(Size(150, 60)),
              //               shape: MaterialStateProperty.all(
              //                 RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(30),
              //                 ),
              //               ),
              //             ),
              //             child: CustomText(
              //               text: ' اطباء',
              //               color: black,
              //               size: 26,
              //               weight: null,
              //             )),
              //       ],
              //     ),
              //   ),
              // ),
              DocInfoCard(
                image: "assets/images/dr_pic.png",
                name: "بيتر عوني ",
                location: "المنوفية",
                price: "2000 LE",
                rating: "4.5",
                distance: "100 km",
                pro: "5555",
              ),
              DocInfoCard(
                image: "assets/images/dr_pic.png",
                name: "بيتر عوني ",
                location: "المنوفية",
                price: "2000 LE",
                rating: "4.5",
                distance: "100 km",
                pro: "5555",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
