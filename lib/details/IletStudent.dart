import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentData extends StatefulWidget {


  @override
  _StudentDataState createState() => _StudentDataState();
}

class _StudentDataState extends State<StudentData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Center(
          child: Text('Coming Soon',
          style: TextStyle(fontSize: 50),),
        ),
    );
  }
}