import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ia_admin/constant/constants.dart';

import '../../../ViewImage.dart';

class PostStatus extends StatefulWidget {
  final String postImage;
  final String sellerPhone;
  final String sellerAddress;
  final String sellerEmail;
  final String slogo;
  final String discription;
  final String publisher;
  final String pid;
  final String productState;
  final String sellerName;
  final String image;
  final String qualification;
  final String sid;

  const PostStatus(
      {Key key,
      this.postImage,
      this.sellerPhone,
      this.sellerAddress,
      this.sellerEmail,
      this.slogo,
      this.discription,
      this.publisher,
      this.pid,
      this.productState,
      this.sellerName,
      this.image,
      time,
      date,
      specialization,
      certficates,
      String plan,
      this.qualification,
      this.sid})
      : super(key: key);

  @override
  _PostStatusState createState() => _PostStatusState();
}

class _PostStatusState extends State<PostStatus> {
  var db = FirebaseDatabase.instance.reference();

  var dataSnap = [];

  var dataPost=[];
  showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  updateApprovePost() {
    db
        .child("Posts")
        .child(widget.pid)
        .update({"productState": "Approved"})
        .whenComplete(() => showSnackBar('Post is Approved'))
        .catchError((onError) {
          print("]-----error-----$onError");
        });
  }

  updateDeletePost() {
    db
        .child("Posts")
        .child(widget.pid)
        .remove()
        .whenComplete(() => showSnackBar('Post is Unapproved'))
        .catchError((onError) {
      print("]-----error-----$onError");
    });
  }

  updateUnApprovePost() {
    db
        .child("Posts")
        .child(widget.pid)
        .update({"productState": "Unapproved"})
        .whenComplete(() => showSnackBar('Post is Delete'))
        .catchError((onError) {
          print("]-----error-----$onError");
        });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.sellerName),
          backgroundColor: kBlueColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder(
                  stream: FirebaseDatabase.instance
                      .reference()
                      .child("Posts")
                      .child(widget.pid)
                      .onValue,
                  builder: (context, AsyncSnapshot<Event> snapshot) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 400,
                              width: 800,
                              child: InteractiveViewer(
                                maxScale: 5,
                                child: Image.network(
                                  widget.postImage,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              widget.sellerName,
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              widget.sellerAddress,
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  // color: Color(0xff0d47a1),
                                  height: 35,
                                  // width: 130,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                        (states) => Color(0xff0d47a1),
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      updateApprovePost();
                                    },
                                    child: Text(
                                      "Approve",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  // color: Color(0xff0d47a1),
                                  height: 35,
                                  // width: 130,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                        (states) => Color(0xff0d47a1),
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      updateUnApprovePost();
                                    },
                                    child: Text(
                                      "Unapproved",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
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
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                        (states) => Color(0xff0d47a1),
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      updateDeletePost();
                                    },
                                    child: Text(
                                      "Delete",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Post Status: ${snapshot.data.snapshot.value["productState"]}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: kBlueColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) =>
                                      ViewImage(image: widget.slogo)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Container(
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(widget.slogo),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Seller Details",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30),
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
                                      Flexible(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Divider(
                                              color: Colors.grey,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                'Phone no.',
                                                style: TextStyle(
                                                  color: kBlueColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                widget.sellerPhone,
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
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                'Qualification',
                                                style: TextStyle(
                                                  color: kBlueColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                widget.qualification,
                                                textDirection:
                                                    TextDirection.ltr,
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
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                'Email',
                                                style: TextStyle(
                                                  color: kBlueColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                widget.sellerEmail,
                                                textDirection:
                                                    TextDirection.ltr,
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
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                'Description',
                                                style: TextStyle(
                                                  color: kBlueColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                widget.discription ?? "",
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
                                color: Colors.white,
                              ),
                              //TabBarPage(),

                              SizedBox(
                                height: height * 0.12,
                                child: AppBar(
                                  backgroundColor: kBlueColor,
                                    automaticallyImplyLeading: false,
                                    bottom: TabBar(
                                      tabs: [
                                        Tab(
                                          icon: Icon(Icons.photo),
                                          text: "Gallery",
                                        ),
                                        Tab(
                                            icon: Icon(
                                                Icons.document_scanner_sharp),
                                            text: "Certificate"),
                                        Tab(
                                            icon: Icon(
                                                Icons.phonelink_setup_rounded),
                                            text: "Posts"),
                                        Tab(
                                            icon: Icon(Icons.comment),
                                            text: "Reviews"),
                                      ],
                                    )),
                              ),
                              Container(
                                height:height,
                                child: TabBarView(
                                  children: [
                                    FutureBuilder(

                                        future: FirebaseDatabase.instance
                                            .reference()
                                            .child("Users")
                                            .orderByChild("uid")
                                            .equalTo(widget.sid)
                                            .once(),
                                        builder: (context,
                                            AsyncSnapshot<DataSnapshot>
                                                snapshot) {
                                          if (snapshot.hasError) {
                                            return Text(
                                                snapshot.error.toString());
                                          }
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return CircularProgressIndicator();
                                          }
                                          if (!snapshot.hasData) {
                                            return Text("No data here!");
                                          }
                                          if (snapshot.connectionState ==
                                              ConnectionState.done) {
                                            Map<dynamic, dynamic> values =
                                                snapshot.data.value;
                                            values.forEach((key, dat) {
                                              dataSnap.add(dat);
                                            });
                                            return (dataSnap[0]["officeGallery"]
                                                        .length !=
                                                    null)
                                                ? GridView.builder(
                                                    shrinkWrap: true,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    itemCount: dataSnap[0]
                                                            ["officeGallery"]
                                                        .length,
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                    ),
                                                    itemBuilder:
                                                        (context, index) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          Navigator.of(context).push(
                                                              MaterialPageRoute(
                                                                  builder: (_) =>
                                                                      ViewImage(
                                                                          image:
                                                                              dataSnap[0]["officeGallery"][index])));
                                                        },
                                                        child: Container(
                                                          height: 100,
                                                          child: Image.network(
                                                            dataSnap[0][
                                                                    "officeGallery"]
                                                                [index],
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  )
                                                : Container();
                                          }
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }),
                                    FutureBuilder(
                                        future: FirebaseDatabase.instance
                                            .reference()
                                            .child("Users")
                                            .orderByChild("uid")
                                            .equalTo(widget.sid)
                                            .once(),
                                        builder: (context,
                                            AsyncSnapshot<DataSnapshot>
                                                snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return CircularProgressIndicator();
                                          }
                                          if (!snapshot.hasData) {
                                            return Text("No data here!");
                                          }
                                          if (snapshot.hasError) {
                                            return Text(
                                                snapshot.error.toString());
                                          }
                                          if (snapshot.connectionState ==
                                              ConnectionState.done) {
                                            Map<dynamic, dynamic> values =
                                                snapshot.data.value;
                                            values.forEach((key, dat) {
                                              dataSnap.add(dat);
                                            });
                                            return (dataSnap[0]["Certificates"]
                                                        .length !=
                                                    null)
                                                ? GridView.builder(
                                                    shrinkWrap: true,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    itemCount: dataSnap[0]
                                                            ["Certificates"]
                                                        .length,
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                    ),
                                                    itemBuilder:
                                                        (context, index) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          Navigator.of(context).push(
                                                              MaterialPageRoute(
                                                                  builder: (_) =>
                                                                      ViewImage(
                                                                          image:
                                                                              dataSnap[0]["Certificates"][index])));
                                                        },
                                                        child: Container(
                                                          height: 100,
                                                          child: Image.network(
                                                            dataSnap[0][
                                                                    "Certificates"]
                                                                [index],
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  )
                                                : Container();
                                          }
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }),
                                    FutureBuilder(
                                        future: FirebaseDatabase.instance
                                            .reference()
                                            .child("Posts")
                                            .orderByChild("sid")
                                            .equalTo(widget.sid)
                                            .once(),
                                        builder: (context,
                                            AsyncSnapshot<DataSnapshot>
                                            snapshot) {

                                          if (!snapshot.hasData) {
                                            return Text("No data here!");
                                          }
                                          if (snapshot.hasError) {
                                            return Text(
                                                snapshot.error.toString());
                                          }
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return CircularProgressIndicator();
                                          }
                                          if (snapshot.connectionState ==
                                              ConnectionState.done) {
                                            Map<dynamic, dynamic> values =
                                                snapshot.data.value;
                                            dataPost.clear();
                                            values.forEach((key, dat) {
                                              dataPost.add(dat);

                                            }

                                            );
                                            print("-----------------${dataPost.length}");
                                            return  (dataPost.length !=0)?

                                                     GridView.builder(
                                                      shrinkWrap: true,
                                                      physics:
                                                      NeverScrollableScrollPhysics(),
                                                      itemCount: dataPost
                                                          .length,
                                                      gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                      ),
                                                      itemBuilder:
                                                          (context, ind) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            Navigator.of(context).push(
                                                                MaterialPageRoute(
                                                                    builder: (_) =>
                                                                        ViewImage(
                                                                            image:
                                                                            dataPost[ind]["image"].toString(),),),);
                                                          },
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(4.0),
                                                            child: Container(
                                                              height: 100,
                                                              child: Image.network(
                                                                dataPost[ind]["image"].toString(),
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ):Container();

                                          }
                                          return Center(
                                              child:
                                              CircularProgressIndicator());
                                        }),
                                    Container(child: Text("Reviews Here")),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class TabBarPage extends StatefulWidget {
  //TabBarPage({Key key, this.title}) : super(key: key);
  //final String title;

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          //title: Text(widget.title),
          backgroundColor: Colors.green,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text('fruits', style: TextStyle(color: kBlueColor)),
              ),
              Tab(
                child: Text('vegetables', style: TextStyle(color: kBlueColor)),
              ),
              Tab(
                child: Text('berries', style: TextStyle(color: kBlueColor)),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(child: Text('Tab 1')),
            Center(child: Text('Tab 2')),
            Center(child: Text('Tab 3')),
          ],
        ),
      ),
    );
  }
}
