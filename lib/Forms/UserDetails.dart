import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // here the desired height
        child: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: Text(
            "Seller Details",
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
        ),
      ),
      body: Text('Name',
      style: TextStyle(fontSize: 20,

      ),
    ),
    );
  }
}
