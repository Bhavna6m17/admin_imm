import 'package:flutter/material.dart';
import 'package:ia_admin/provider/auth_provider.dart';
import 'package:provider/provider.dart';

import 'Home/Home.dart';

class OtpaScreen extends StatefulWidget {

  @override
  _OtpaScreenState createState() => _OtpaScreenState();
}

class _OtpaScreenState extends State<OtpaScreen> {
  final TextEditingController OTPcontroller = TextEditingController();
   void _showErrorDialog(BuildContext context, String message) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Error Occured'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text('OK!'),
            )
          ],
        ),
      );
    }
  verifyOTP(BuildContext context) {
      try {
        Provider.of<AuthProvider>(context, listen: false)
            .verifyOTP(OTPcontroller.text.toString())
            .then((_) {
          // if (Provider.of<AuthProvider>(context, listen: false)
          //     .user
          //     .additionalUserInfo
          //     .isNewUser) {
          //   return Navigator.pushReplacement(
          //       context, MaterialPageRoute(builder: (context) => Register()));
         // } else {
            return Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
        //  }

          // Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => Register(),
          //     ));
        }).catchError((e) {
          String errorMsg = 'Cant authentiate you Right now, Try again later!';
          if (e.toString().contains("ERROR_SESSION_EXPIRED")) {
            errorMsg = "Session expired, please resend OTP!";
          } else if (e.toString().contains("ERROR_INVALID_VERIFICATION_CODE")) {
            errorMsg = "You have entered wrong OTP!";
          } else if (OTPcontroller.text.isEmpty) {
            errorMsg = "Please enter OTP";
          }
          _showErrorDialog(context, errorMsg);
        });
      } catch (e) {
        _showErrorDialog(context, e.toString());
      }
    }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              Image.asset("images/logo.jpeg",height: 190,),
              SizedBox(height: 120),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),

                child: TextField(
                  controller: OTPcontroller,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  maxLength: 6,

                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(

                      hintText: "Enter your OTP",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                      ),             ),
                ),
              ),
          Container(
              // color: Color(0xff0d47a1),
            height: 50, width: 130,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith((states) => Color(0xff0d47a1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
            ),
          ),
              ),
              onPressed: (){
             verifyOTP(context);
            }, child: Text("Login",
              style: TextStyle(color: Colors.white,
                  fontSize: 18
              ),
            ),

            ),
          ),
            ],

          ),
        ),
      ),
    );
  }
}
