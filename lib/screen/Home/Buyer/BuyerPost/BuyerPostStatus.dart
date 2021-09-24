import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class BuyPostStatus extends StatefulWidget {
  String name;
  String buyerPhone;
  String buyerEmail;
  String address;
  String description;
  String designation;
  String imageprofileimage;
  String image;
  String pid;
  BuyPostStatus(
      {Key key,
      this.pid,
      this.name,
      this.buyerPhone,
      this.buyerEmail,
      this.address,
      this.description,
      this.designation,
      this.imageprofileimage,
      this.image});

  @override
  _BuyPostStatusState createState() => _BuyPostStatusState();
}

class _BuyPostStatusState extends State<BuyPostStatus> {
  DatabaseReference db = FirebaseDatabase.instance.reference();
  showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  updateApprovePost() {
    db
        .child("BuyerPosts")
        .child(widget.pid)
        .update({"productState": "Approved"})
        .whenComplete(() => showSnackBar("Post is Approved!"))
        .catchError((onError) {
          print("]-----error-----$onError");
        });
  }

  updateDeletePost() {
    db
        .child("BuyerPosts")
        .child(widget.pid)
        .remove()
        .whenComplete(() => showSnackBar("Post is deleted!"))
        .catchError((onError) {
      print("]-----error-----$onError");
    });
  }

  updateUnApprovePost() {
    db
        .child("BuyerPosts")
        .child(widget.pid)
        .update({"productState": "Unapproved"})
        .whenComplete(() => showSnackBar("Post is UnApproved!"))
        .catchError((onError) {
          print("]-----error-----$onError");
        });
  }

  @override
  Widget build(BuildContext context) {
    db.child('BuyerPosts');
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirebaseDatabase.instance
              .reference()
              .child("BuyerPosts")
              .child(widget.pid)
              .onValue,
          builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
            print(
                "------------hbbd ${snapshot.data.snapshot.value["productState"]}");
            return SingleChildScrollView(
              child: Column(
                children: [
                  InteractiveViewer(
                    maxScale: 5.0,
                    child: Container(
                      height: 400,
                      width: 800,
                      child: Image.network(
                        widget.image,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        // color: Color(0xff0d47a1),
                        height: 35,
                        // width: 130,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Color(0xff0d47a1),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            updateApprovePost();
                          },
                          child: Text(
                            "Approve",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        // color: Color(0xff0d47a1),
                        height: 35,
                        // width: 130,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Color(0xff0d47a1),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            updateUnApprovePost();
                          },
                          child: Text(
                            "Unapprove",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        // color: Color(0xff0d47a1),
                        height: 35,
                        // width: 130,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Color(0xff0d47a1),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            updateDeletePost();
                          },
                          child: Text(
                            "Delete",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Buyer Details",
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 1,
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                child: Container(
                                  height: 100,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          widget.imageprofileimage),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        widget.name,
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    // Divider(color: Colors.grey,),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        widget.buyerPhone,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    // Divider(color: Colors.grey,),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        widget.buyerEmail,
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          snapshot.data.snapshot.value["productState"],
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          widget.designation,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
