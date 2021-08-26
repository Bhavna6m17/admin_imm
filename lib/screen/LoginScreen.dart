import 'package:flutter/material.dart';
import 'package:ia_admin/provider/auth_provider.dart';
import 'package:ia_admin/screen/OtpScreen.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
    String countryCode = "+91";

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
   verifyPhone(BuildContext context) {
    try {
      Provider.of<AuthProvider>(context, listen: false)
          .verifyPhone(
              countryCode,
              countryCode +
                  Provider.of<AuthProvider>(context, listen: false)
                      .phoneController
                      .text
                      .toString())
          .then((value) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OtpaScreen(),
        ));
      }).catchError((e) {
        String errorMsg = 'Cant Authenticate you, Try Again Later';
        if (Provider.of<AuthProvider>(context, listen: false)
                .phoneController
                .text
                .length <
            10) {
          String errorMsg = "Please enter mobile number";
          _showErrorDialog(context, errorMsg);
        } else if (e.toString().contains(
            'We have blocked all requests from this device due to unusual activity. Try again later.')) {
          errorMsg = 'Please wait as you have used limited number request';
        }
        _showErrorDialog(context, errorMsg);
      });
    } catch (e) {
      _showErrorDialog(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

        body: Align(
          alignment: Alignment.topCenter,
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height:10,),
              Image.asset("images/logo.jpeg",height: 190,),
              SizedBox(height: 20,),
              Text("Login Here!",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  color: Color(0xff0d47a1),
                ),),
              SizedBox(height: 100,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: Provider.of<AuthProvider>(context,listen: false).phoneController,
                  style: TextStyle(
                    fontSize: 26,
                  ),
                  maxLength:10 ,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Enter your mobile number",
                      prefix: Text("+91 | "),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22.0)
                      )              ),
                ),
              ),
              Container(
                color: Color(0xff0d47a1),
                height: 50,width: 130,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) => Color(0xff0d47a1))
                  ),
                  onPressed: (){
                  verifyPhone(context);
                },
                  child: Text("Next",
                  style: TextStyle(color: Colors.white,
                      fontSize: 23
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
