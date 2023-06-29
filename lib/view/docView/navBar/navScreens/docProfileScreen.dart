import 'package:flutter/material.dart';

import '../../../../constant.dart';

class DocProfileScreen extends StatefulWidget {
  const DocProfileScreen({Key? key}) : super(key: key);

  @override
  State<DocProfileScreen> createState() => _DocProfileScreenState();
}

class _DocProfileScreenState extends State<DocProfileScreen> {
  TextEditingController? _nameController;
  TextEditingController? _specializationController;
  TextEditingController? _aboutController;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'Dr. John Doe');
    _specializationController = TextEditingController(text: 'Cardiology Specialist');
    _aboutController = TextEditingController(
      text: 'Dr. John Doe is a highly experienced cardiologist with expertise in diagnosing and treating heart diseases. He has been practicing medicine for over 15 years and has successfully treated numerous patients. He is dedicated to providing the best possible care to his patients.',
    );
  }

  @override
  void dispose() {
    _nameController?.dispose();
    _specializationController?.dispose();
    _aboutController?.dispose();
    super.dispose();
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _saveChanges() {
    String newName = _nameController!.text;
    String newSpecialization = _specializationController!.text;
    String newAbout = _aboutController!.text;

    // Perform any desired actions with the updated data
    print('Name: $newName');
    print('Specialization: $newSpecialization');
    print('About: $newAbout');

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
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildEditableTextField(TextEditingController controller, String labelText) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }

  Widget _buildNormalTextField(TextEditingController controller, String labelText) {
    return Text(
      controller.text,
      style: TextStyle(fontSize: 16.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Container(

          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/dr_pic.png'),
                ),
                SizedBox(height: 16),
                _isEditing
                    ? _buildEditableTextField(_nameController!, 'Name')
                    : _buildNormalTextField(_nameController!, 'Name'),
                SizedBox(height: 8),
                _isEditing
                    ? _buildEditableTextField(_specializationController!, 'Specialization')
                    : _buildNormalTextField(_specializationController!, 'Specialization'),
                SizedBox(height: 16),
                Text(
                  'About:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                _isEditing
                    ? TextField(
                  controller: _aboutController,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: 'About',
                  ),
                )
                    : Text(
                  _aboutController!.text,
                  style: TextStyle(fontSize: 16.0),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/4),
                  child: Center(
                    child: Container(
                      child: IconButton(
                        icon: Icon(_isEditing ? Icons.done : Icons.edit , color: white,),
                        onPressed: _toggleEdit,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: active
                      ),
                    ),
                  ),
                ),
                if (_isEditing)
                  Center(
                    child: Container(
                      child: IconButton(
                        icon: Icon(Icons.save , color: white,),
                        onPressed: _saveChanges,
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: active
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}