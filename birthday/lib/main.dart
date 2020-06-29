import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreenAccent,
        appBar: AppBar(
          title: Text('Its Your Birthday!!!'),
          backgroundColor: Colors.pinkAccent.shade100,
        ),
        body: BirthdayPage(),
      ),
    ),
  );
}

class BirthdayPage extends StatefulWidget {
  @override
  _BirthdayPageState createState() => _BirthdayPageState();
}

class _BirthdayPageState extends State<BirthdayPage> {
  int birthdayNumber = 1;
  void diceChange(){
    birthdayNumber ++;
    if (birthdayNumber == 17){
      birthdayNumber = 1;
    };
  }


  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(20.0),
                  child: Image.asset(
                    'images/images$birthdayNumber.jpg',
                    height: 500.0,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(40.0),
                child: RawMaterialButton(
                  onPressed: (){
                    setState(() {
                      diceChange();
                    });
                  },
                  fillColor: Colors.pinkAccent.shade100,
                  child: Icon(
                    Icons.cake,
                    size: 100.0,
                  ),
                  padding: EdgeInsets.all(25.0),
                  shape: CircleBorder(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
