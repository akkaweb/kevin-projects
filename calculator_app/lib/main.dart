import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String symbols = "";

  ButtonTapped(String buttonValue){
    if(buttonValue == "Clear"){
       _output = "0";
       num1 = 0.0;
       num2 = 0.0;
       symbols = "";
    }else if(buttonValue == "+" || buttonValue == "-" || buttonValue == "x" || buttonValue == "/"){
      num1 = double.parse(output);
      symbols = buttonValue;
      _output = "0";
    }else if(buttonValue == "."){
      if(_output.contains(".")){
        print('Already contains a decimal');
        return;
      } else {
        _output = _output + buttonValue;
      }
    }else if(buttonValue == "="){
      num2 = double.parse(output);
      if(symbols == "+"){
        _output = (num1 + num2).toString();
      }else if(symbols == "-"){
        _output = (num1 - num2).toString();
      }else if(symbols == "x"){
        _output = (num1 * num2).toString();
      }else if(symbols == "/"){
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      symbols = "";
    }else if(buttonValue == "π"){
      _output = _output + pi.toString();
    } else {
      _output = _output + buttonValue;
    }

    print(_output);
    setState(() {
      output = double.parse(_output).toString();
    });
  }

  Widget buildButton(String buttonValue) {
    return Expanded(
      child: DecoratedBox(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(),
          color: Colors.teal,
        ),
        child: OutlineButton(
          padding: EdgeInsets.all(20.0),
          child: Text(
            buttonValue,
            style: TextStyle(
              fontSize: 27.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          textColor: Colors.white,
          onPressed: (){
            ButtonTapped(buttonValue);
          },
        ),
      ),
    );


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0,),
                child: Text(output,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ),
            Expanded(child: Divider()),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("/"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("x"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("."),
                    buildButton("0"),
                    buildButton("π"),
                    buildButton("+"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("Clear"),
                    buildButton("="),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
