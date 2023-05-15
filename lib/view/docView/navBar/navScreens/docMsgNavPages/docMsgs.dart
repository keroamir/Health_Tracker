import 'package:flutter/material.dart';



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
          return ListTile(
            title: Text(messages[index]),
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
