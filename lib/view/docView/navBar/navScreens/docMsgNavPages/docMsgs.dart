import 'package:flutter/material.dart';

import '../../../../../constant.dart';

class DocMsgs extends StatefulWidget {
  @override
  _DocMsgsState createState() => _DocMsgsState();
}

class _DocMsgsState extends State<DocMsgs> {
  List<String> messages = [];

  TextEditingController _textEditingController = TextEditingController();

  void _sendMessage(String message) {
    setState(() {
      messages.add(message);
      _textEditingController.clear();
    });
  }

  Widget _buildChatList() {
    return Expanded(
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Container(
                padding: EdgeInsets.all(10),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: devider),
                  child: Icon(
                    Icons.person,
                    color: active,
                  )),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              title: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: devider, borderRadius: BorderRadius.circular(30)),
                  child: Text(messages[index])),
            ),
          );
        },
      ),
    );
  }

  Widget _buildChatInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Type your message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              _sendMessage(_textEditingController.text);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Column(
        children: [
          _buildChatList(),
          Divider(height: 1.0),
          _buildChatInput(),
        ],
      ),
    );
  }
}
