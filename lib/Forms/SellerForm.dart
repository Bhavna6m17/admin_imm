import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ia_admin/details/Post.dart';

class SellerForm extends StatefulWidget {
  @override
  _SellerFormState createState() => _SellerFormState();
}

class _SellerFormState extends State<SellerForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // here the desired height
        child: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: Text(
            "Seller Details",
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter your name',
                  labelText: 'Name',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.email),
                  hintText: 'Enter your email id ',
                  labelText: 'Email ID ',
                ),
              ),
              TextFormField(
                maxLength: 10,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.phone),
                  hintText: 'Enter a phone number',
                  labelText: 'Phone',
                ),
              ),
              TextFormField(
                maxLength: 12,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.document_scanner_sharp),
                  hintText: 'Enter your Aadhar Number ',
                  labelText: 'Aadhar Number ',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.work),
                  hintText: 'Enter your Company Name ',
                  labelText: 'Company name ',
                ),
              ),
              SizedBox(
                height: 90,
                width: 80,
              ),
              Row(children: [
                IconButton(
                  icon: Icon(Icons.add_business_sharp),
                  iconSize: 70,
                  color: Colors.grey,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Posts(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.event),
                  iconSize: 70,
                  color: Colors.grey,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Posts(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.note),
                  iconSize: 70,
                  color: Colors.grey,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Posts(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.photo),
                  iconSize: 70,
                  color: Colors.grey,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Posts(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.reviews),
                  iconSize: 70,
                  color: Colors.grey,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Posts(),
                      ),
                    );
                  },
                ),
              ]),
              Container(
                padding: const EdgeInsets.only(left: 40.0, top: 40.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Color(0xff0d47a1))),
                  onPressed: () {},
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white, fontSize: 23),
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
