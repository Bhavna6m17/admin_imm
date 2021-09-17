import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
String fullName;
String phone;
String qualification;
String address;
String fathername;

Test({Key key, this.fullName,this.fathername,this.phone,this.address,this.qualification});
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child: Scaffold(
        body: SingleChildScrollView(
        child:
        Column(
        children: [
        Container(
          child: Text(
            widget.fullName,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
          Container(
            child: Text(
              widget.fathername,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Container(
            child: Text(
              widget.phone,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Container(
            child: Text(
              widget.address,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Container(
            child: Text(
              widget.qualification,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
  ]
        ),
        ),
      ),
    );
  }
}