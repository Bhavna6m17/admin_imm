
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LoginScreen.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
  
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login(),),);
    });
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            Center(child: Image.asset("images/logo.jpeg",height: height * 0.2)),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: Center(
                  child: Text("IMMIGRATION ADDA",
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
