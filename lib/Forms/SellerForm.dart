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
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: (){
                  },
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage:  AssetImage('images/icons_person.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Phone Number',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'email Id',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Company Name',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                      ),
                    ),
                  ),
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
                ]
                ),
            ],
          ),
    );
  }
}
