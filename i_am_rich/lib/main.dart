import 'package:flutter/material.dart';

//Main Function is starting point for all apps of Flutter
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text("I am Rich"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Image(
          image: AssetImage('images/diamond.png'),
        ),
      ),
    ),
  ));
}

