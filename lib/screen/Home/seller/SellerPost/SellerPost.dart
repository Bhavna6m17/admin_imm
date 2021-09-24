import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'SellerPostStatus.dart';

class SellerPost extends StatefulWidget {
  const SellerPost({Key key}) : super(key: key);

  @override
  _SellerPostState createState() => _SellerPostState();
}

class _SellerPostState extends State<SellerPost> {
  var db = FirebaseDatabase.instance.reference();
  List dataSnap = [];
  fetchData() {
    db.child("Posts").once().then((DataSnapshot value) {
      Map<dynamic, dynamic> data = value.value;
      data.forEach((key, value) {
        print("-----------${value["date"]}");
      });
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('SellerPosts'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: FutureBuilder<DataSnapshot>(
        future: db.child("Posts").once(),
        builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Text("No data here!"));
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<dynamic, dynamic> values = snapshot.data.value;
            values.forEach((key, dat) {
              dataSnap.add(dat);
              print("-----------${dataSnap[0]["sellerName"]}");
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
                final sellerName = dataSnap[index]["sellerName"].toString();
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostStatus(
                          postImage: dataSnap[index]["image"].toString(),
                          discription:
                              dataSnap[index]["discription"].toString(),
                          pid: dataSnap[index]["pid"].toString(),
                          publisher: dataSnap[index]["publisher"].toString(),
                          sellerEmail:
                              dataSnap[index]["sellerEmail"].toString(),
                          slogo: dataSnap[index]["slogo"].toString(),
                          sellerAddress:
                              dataSnap[index]["sellerAddress"].toString(),
                          productState:
                              dataSnap[index]["productState"].toString(),
                          sellerPhone:
                              dataSnap[index]["sellerPhone"].toString(),
                          sellerName: dataSnap[index]["sellerName"].toString(),
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 1,
                    child: Container(
                      //height: height * 0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // height: 50,
                            // width: 50,
                            child: Image.network(
                             image,
                              height: 100,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Text(
                                sellerName,
                                style: TextStyle(
                                  textBaseline: TextBaseline.alphabetic,
                                  color: Colors.blue.shade900,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
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
