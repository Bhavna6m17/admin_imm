import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HotAreas extends StatefulWidget {


  @override
  _HotAreasState createState() => _HotAreasState();
}

class _HotAreasState extends State<HotAreas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: Text('Highly Target Areas'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Center(
          child: Text('Coming Soon',
          style: TextStyle(fontSize: 50),),
        ),
    );
  }
}