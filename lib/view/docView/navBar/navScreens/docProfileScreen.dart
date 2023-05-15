import 'package:flutter/material.dart';

class DocProfileScreen extends StatefulWidget {
  const DocProfileScreen({Key? key}) : super(key: key);

  @override
  State<DocProfileScreen> createState() => _DocProfileScreenState();
}

class _DocProfileScreenState extends State<DocProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
    );
  }
}
