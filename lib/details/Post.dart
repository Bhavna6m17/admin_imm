import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Posts extends StatefulWidget {
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  List dataSnap = [];
  DatabaseReference db = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('Posts'),
          backgroundColor: Colors.blue.shade900,
        ),
        body: FutureBuilder<DataSnapshot>(
          future: db.child("Posts").limitToLast(10).once(),
          builder: (context,AsyncSnapshot<DataSnapshot> snapshot) {
            if(!snapshot.hasData){
              return Center(child: Text("No data here!"));
            }
            if(snapshot.hasError){
              return Center(child: Text(snapshot.error.toString()));
            }
            if (snapshot.connectionState == ConnectionState.active) {
              Map<dynamic, dynamic> values = snapshot.data.value;
              values.forEach((key, dat) {
                dataSnap.add(dat);
                print("-----------${dataSnap[0]["sellerName"]}");
              });
              return ListView.builder(
                itemBuilder: (context, index) {
                  final image = dataSnap[index]["image"].toString();
                  final sellerName = dataSnap[index]["sellerName"].toString();
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height * 0.25,
                        child: Column(
                          children: [
                            Container(
                                height: height * 0.13,
                                child: Image.network(image)),
                            Text(sellerName),
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
        ));
  }
}
