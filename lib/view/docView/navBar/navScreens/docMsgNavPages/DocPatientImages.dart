import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../constant.dart';

class DocPatientImage extends StatefulWidget {
  const DocPatientImage({Key? key}) : super(key: key);

  @override
  State<DocPatientImage> createState() => _DocPatientImageState();
}

class _DocPatientImageState extends State<DocPatientImage> {
  final TextEditingController _textEditingController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  List<ChatMessage> _messages = [];

  Future<void> _pickImage() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _messages.add(
          ChatMessage(
            imageFile: File(pickedFile.path),
            sender: 'John',
            timestamp: DateTime.now(),
          ),
        );
      });
    }
  }
  Future<void> _openImage(File imageFile) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width/1.5,
            height: MediaQuery.of(context).size.height/1.5,
            child: Image.file(imageFile),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  leading: GestureDetector(
                      onTap: () => _openImage(message.imageFile),
                      child: Image.file(message.imageFile)),
                  title: Text(message.sender),
                  subtitle: Text(message.timestamp.toString()),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height/10,
                width: MediaQuery.of(context).size.height/10,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: active
                ),
                child: IconButton(
                  icon: Icon(Icons.attach_file, color: Colors.white,),
                  onPressed: _pickImage,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final File imageFile;
  final String sender;
  final DateTime timestamp;

  ChatMessage({required this.imageFile, required this.sender, required this.timestamp});
}
