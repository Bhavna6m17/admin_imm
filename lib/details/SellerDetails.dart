
import 'package:flutter/material.dart';
class Seller extends StatefulWidget {

  @override
  _SellerState createState() => _SellerState();
}

class _SellerState extends State<Seller> {
  final name =[
    "Ram",
    "Shyam",
    "mayank",
    "Gourav",
    "Kunal",
    "krish"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // here the desired height
        child: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: Text("Seller Details",
            style: TextStyle(fontSize: 40,
                color: Colors.white),
          ),
        ),
      ),
      body:ListView.builder(
        itemCount: name.length,
          itemBuilder: (context,index){
        return Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80")
                  )
                ),
              ),
              SizedBox(width: 50,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(name[index])
                ],
              ),
            ],
          ),
        );
      }
      ),
    );
  }
}
      
