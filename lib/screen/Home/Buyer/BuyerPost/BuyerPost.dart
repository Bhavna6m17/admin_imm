import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ia_admin/Models/PostModel.dart';
import 'package:ia_admin/Models/PostModel.dart';
import 'package:ia_admin/Models/PostModel.dart';
import 'package:ia_admin/Models/PostModel.dart';
import 'package:ia_admin/screen/Home/Buyer/BuyerPost/BuyerPostStatus.dart';
import 'package:ia_admin/screen/Home/seller/SellerPost/SellerPostStatus.dart';
import 'package:http/http.dart';

class BuyerPost extends StatefulWidget {
  const BuyerPost({Key key}) : super(key: key);

  @override
  _BuyerPostState createState() => _BuyerPostState();
}

class _BuyerPostState extends State<BuyerPost> {
  var db = FirebaseDatabase.instance.reference();
  List dataSnap = [];
  fetchData() {
    db.child("BuyerPosts").once().then((DataSnapshot value) {
      Map<dynamic, dynamic> data = value.value;
      data.forEach((key, value) {
        print("-----------${value["date"]}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    void initState() {
      fetchData();
      super.initState();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Buyer Post'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: FutureBuilder<DataSnapshot>(
        future: db.child("BuyerPosts").once(),
        builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
          // if (!snapshot.hasData) {
          //   return Center(child: Text("No data here!"));
          // }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<dynamic, dynamic> values = snapshot.data.value;
            values.forEach((key, dat) {
              dataSnap.add(dat);
              print("-----------${dataSnap[0]["name"]}");
            });
            return GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 3 / 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final image = dataSnap[index]["image"].toString();
                final sellerName = dataSnap[index]["name"].toString();
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BuyPostStatus(
                          pid: dataSnap[index]["pid"].toString(),
                          image: dataSnap[index]["image"].toString(),
                          description:
                              dataSnap[index]["discription"].toString(),
                          // pid: dataSnap[index]["pid"].toString(),
                          // description: dataSnap[index]["publisher"].toString(),
                          buyerEmail: dataSnap[index]["BuyerEmail"].toString(),
                          imageprofileimage:
                              dataSnap[index]["slogo"].toString(),
                          address: dataSnap[index]["BuyerAddress"].toString(),
                          designation:
                              dataSnap[index]["productState"].toString(),
                          buyerPhone: dataSnap[index]["BuyerPhone"].toString(),
                          name: dataSnap[index]["name"].toString(),
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 1,
                    child: Container(
                      height: height * 0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              // height: 50,
                              // width: 50,
                              child: Image.network(
                                image,
                                height: height*0.2,
                                width: width,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              sellerName,
                              style: TextStyle(
                                textBaseline: TextBaseline.alphabetic,
                                color: Colors.blue.shade900,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: dataSnap.length,
             );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
