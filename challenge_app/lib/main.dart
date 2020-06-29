import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Center(child: Text('Ronaldo is the Best')),
          backgroundColor: Colors.black54,
          leading: Builder(
            builder: (BuildContext context){
              return IconButton(
                icon: const Icon(
                  Icons.attach_money,
                  color: Colors.green,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ),
        body: Center(
          child: Image(
              image: AssetImage('assets/Ronaldo-9.jpg'),
          ),
        ),
      ),
    ),
  );
}
