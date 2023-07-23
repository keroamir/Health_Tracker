import 'package:HealthTracker/constant.dart';
import 'package:HealthTracker/controller/userController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Profile_Pnt extends StatefulWidget {
  const Profile_Pnt({Key? key}) : super(key: key);

  @override
  State<Profile_Pnt> createState() => _Profile_PntState();
}

class _Profile_PntState extends State<Profile_Pnt> {
  TextEditingController? _nameController;
  TextEditingController? _mailController;
  TextEditingController? _numberController;

  bool _isEditing = false;

  @override
  void dispose() {
    _nameController?.dispose();
    _mailController?.dispose();
    _numberController?.dispose();

    super.dispose();
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _saveChanges() {
    String? newName = _nameController!.text;
    String? newMail = _mailController!.text;
    String? newNumber = _numberController!.text;

    // Perform any desired actions with the updated data
    updateProfile(newName, newNumber, newMail);

    _toggleEdit(); // Disable editing mode after saving changes

    // Show a success message or perform further actions
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Changes Saved'),
          content: Text('Your profile has been updated successfully.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => Profile_Pnt(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildEditableTextField(
      TextEditingController controller, String labelText) {
    return TextFormField(
      controller: controller,
      cursorColor: active,
      maxLines: 1,
      decoration: InputDecoration(
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(20.0),
        //   borderSide: BorderSide(
        //     color: Colors.grey, // Customize the border color
        //   ),
        // ),
        labelText: labelText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.grey, // Customize the enabled border color
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: active, // Customize the focused border color
          ),
        ),
      ),
      textDirection: TextDirection.rtl,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: black,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'الرجاء ادخل $labelText ';
        }
        return null; // Return null if the input is valid
      },
    );
  }

  Widget _buildNormalTextField(
      TextEditingController controller, String labelText) {
    return Text(
      controller.text,
      textDirection: TextDirection.rtl,
      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
    );
  }

  Future<void> updateProfile(String? name, String? phone, String? email) async {
    var url =
        Uri.parse('http://healthtracker.frmawy.com/api/user/update_profile');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? authToken = prefs.getString('auth_token');

    var data = {
      'name': '${name}',
      'email': '${email}',
      'phone': '${phone}',
    };

    var response = await http.post(url,
        headers: {
          'Authorization': '$authToken',
        },
        body: data);
    if (response.statusCode == 200) {
      print("sssssssssssssss${response.body}");
    }  else {
  throw Exception('Failed to fetch user data');
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Row(
            children: [
              Container(
                child: Image(
                  image: AssetImage("assets/logo/5.png"),
                ),
                width: MediaQuery.of(context).size.width / 2,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  )),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 50,
          ),
        ],
      ),
      body: FutureBuilder(
        future: UserController().fetchUserData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          _nameController =
              TextEditingController(text: '${snapshot.data.data.name}');
          _mailController =
              TextEditingController(text: '${snapshot.data.data.email}');
          _numberController = TextEditingController(
            text: '${snapshot.data.data.phone}',
          );
          if (snapshot.data != null) {
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Image.asset("assets/images/Group 1257@3x.png",
                      fit: BoxFit.fill),
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
                        ),
                        CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              AssetImage('assets/images/dr_pic.png'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        _isEditing
                            ? _buildEditableTextField(_nameController!, 'الاسم')
                            : _buildNormalTextField(_nameController!, 'الاسم'),
                        SizedBox(
                          height: 20,
                        ),
                        _isEditing
                            ? _buildEditableTextField(
                                _mailController!, 'البريد الالكتروني')
                            : _buildNormalTextField(
                                _mailController!, 'البريد الالكتروني'),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _isEditing
                                ? TextFormField(
                                    controller: _numberController,
                                    cursorColor: active,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      constraints: BoxConstraints(
                                          maxWidth: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2),
                                      // border: OutlineInputBorder(
                                      //   borderRadius: BorderRadius.circular(20.0),
                                      //   borderSide: BorderSide(
                                      //     color: Colors.grey, // Customize the border color
                                      //   ),
                                      // ),
                                      labelText: "رقم الجوال",
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: Colors
                                              .grey, // Customize the enabled border color
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color:
                                              active, // Customize the focused border color
                                        ),
                                      ),
                                    ),
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: black,
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'الرجاء ادخل رقمك';
                                      }
                                      if (value.length != 11) {
                                        return 'يجب ان يكون مكون من 11 رقم';
                                      }
                                      return null; // Return null if the input is valid
                                    },
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(11),
                                      // Limit input to 11 characters
                                    ],
                                  )
                                : _buildNormalTextField(
                                    _numberController!, 'رقم الجوال'),
                            SizedBox(
                              width: 20,
                            ),
                            Material(
                              elevation: 5,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * .05,
                                width: MediaQuery.of(context).size.width * .1,
                                child: Icon(
                                  Icons.phone,
                                  size: 35,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            // Show a loading indicator while waiting for the future to complete
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: active,
        onPressed: () {
          if (_isEditing) {
            _saveChanges();
          } else {
            _toggleEdit();
          }
        },
        child: Icon(
          _isEditing ? Icons.save : Icons.edit,
          color: white,
        ),
      ),
    );
  }
}
