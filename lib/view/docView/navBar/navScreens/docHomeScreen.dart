import 'package:flutter/material.dart';

class DocHomeScreen extends StatefulWidget {
  const DocHomeScreen({Key? key}) : super(key: key);

  @override
  State<DocHomeScreen> createState() => _DocHomeScreenState();
}

class _DocHomeScreenState extends State<DocHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
    );
  }
}
