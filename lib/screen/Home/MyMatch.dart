import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyMatch extends StatefulWidget {
  

  @override
  _MyMatchState createState() => _MyMatchState();
}

class _MyMatchState extends State<MyMatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: Text('My Match'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Center(
          child: Text('Coming Soon',
          style: TextStyle(fontSize: 50),),
        ),
    );
  }
}