import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ia_admin/constant/constants.dart';

import '../../../ViewImage.dart';

class UserDetails extends StatefulWidget {
  final String type;
  final String name;
  final String phone;
  final String profileimg;
  final String email;
  final List data;
  final String description;
  final String uid;
  final List officeGallery;

  const UserDetails({
    Key key,
    this.type,
    this.name,
    this.phone,
    this.profileimg,
    this.email,
    this.data,
    this.description,
    this.uid,
    this.officeGallery,
  }) : super(key: key);
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  List dataSnap = [];

  List dataList = [];

  List dataPost = [];
  @override
  void initState() {
    print("gal----------------${widget.officeGallery}");
    super.initState();
  }

  showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  deleteSeller() {
    FirebaseDatabase.instance
        .reference()
        .child("Users")
        .orderByChild("uid")
        .equalTo(widget.uid)
        .reference()
        .remove()
        .whenComplete(() {
      showSnackBar("Seller Delete successfully!");
    }).catchError((onError) {
      showSnackBar("Error Ocuured ${onError.toString()}");
    });
    FirebaseDatabase.instance
        .reference()
        .child("Sellers")
        .orderByChild("uid")
        .equalTo(widget.uid)
        .reference()
        .remove()
        .whenComplete(() {
      showSnackBar("Seller Delete successfully!");
    }).catchError((onError) {
      showSnackBar("Error Ocuured ${onError.toString()}");
    });
  }

  deleteDialogue() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        double width = MediaQuery.of(context).size.width;
        // return object of type Dialog
        return Dialog(
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "You sure want to delete?",
                      //style: blackHeadingTextStyle,
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: (width / 3.5),
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              'Cancel',
                              //style: blackColorButtonTextStyle,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            deleteSeller();
                            Navigator.pop(context);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Login()));
                          },
                          child: Container(
                            width: (width / 3.5),
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: kBlueColor,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              'Delete',
                              style: TextStyle(color: kWhiteColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Center(
          child: Text(
            widget.name,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
      body: DefaultTabController(
        length: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: ListView(
            shrinkWrap: true,
            children: [
              // Text(widget.officeGallery.toString()??""),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    widget.profileimg != ""
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewImage(
                                      image: widget.profileimg,
                                    )),
                          )
                        : showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text("No image here!"),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancel"),
                                    ),
                                  ],
                                ));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: widget.profileimg == ""
                        ? Image.asset('images/icons8-person-80.png')
                        : Image.network(widget.profileimg),
                  ),
                  // CircleAvatar(
                  //     radius: 120,
                  //     backgroundImage: widget.profileimg == ""
                  //         ? AssetImage('images/business man icon.png')
                  //         : NetworkImage(widget.profileimg)),
                ),
              ),
              // SizedBox(
              //   height: 30,
              // ),
              Container(
                height: 35,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Color(0xff0d47a1),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    deleteDialogue();
                  },
                  child: Text(
                    "Delete Seller",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  enabled: false,
                  initialValue: widget.name ?? "null",
                  decoration: InputDecoration(labelText: "Name"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  enabled: false,
                  initialValue: widget.phone ?? "null",
                  decoration: InputDecoration(labelText: "Phone"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  enabled: false,
                  initialValue: widget.email ?? "null",
                  decoration: InputDecoration(labelText: "Email"),
                ),
              ),
              widget.type == "User"
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.description ?? "No data",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
              widget.type == "Seller"
                  ? Column(
                      children: [
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
                                      icon: Icon(Icons.document_scanner_sharp),
                                      text: "Certificate"),
                                  Tab(
                                      icon: Icon(Icons.phonelink_setup_rounded),
                                      text: "Posts"),
                                  Tab(
                                      icon: Icon(Icons.comment),
                                      text: "Reviews"),
                                ],
                              )),
                        ),
                        Container(
                          height: height,
                          child: TabBarView(
                            children: [
                              FutureBuilder(
                                  future: FirebaseDatabase.instance
                                      .reference()
                                      .child("Users")
                                      .orderByChild("uid")
                                      .equalTo(widget.uid)
                                      .once(),
                                  builder: (context,
                                      AsyncSnapshot<DataSnapshot> snapshot) {
                                    if (snapshot.hasError) {
                                      return Text(snapshot.error.toString());
                                    }
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return CircularProgressIndicator();
                                    }
                                    if (snapshot.hasError) {
                                      return Text(snapshot.error.toString());
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
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (_) => ViewImage(
                                                                image: dataSnap[
                                                                            0][
                                                                        "officeGallery"]
                                                                    [index])));
                                                  },
                                                  child: Container(
                                                    height: 100,
                                                    child: Image.network(
                                                      dataSnap[0]
                                                              ["officeGallery"]
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
                                        child: CircularProgressIndicator());
                                  }),
                              FutureBuilder(
                                  future: FirebaseDatabase.instance
                                      .reference()
                                      .child("Users")
                                      .orderByChild("uid")
                                      .equalTo(widget.uid)
                                      .once(),
                                  builder: (context,
                                      AsyncSnapshot<DataSnapshot> snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return CircularProgressIndicator();
                                    }
                                    if (!snapshot.hasData) {
                                      return Text("No data here!");
                                    }
                                    if (snapshot.hasError) {
                                      return Text(snapshot.error.toString());
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
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (_) => ViewImage(
                                                                image: dataSnap[
                                                                            0][
                                                                        "Certificates"]
                                                                    [index])));
                                                  },
                                                  child: Container(
                                                    height: 100,
                                                    child: Image.network(
                                                      dataSnap[0]
                                                              ["Certificates"]
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
                                        child: CircularProgressIndicator());
                                  }),
                              FutureBuilder(
                                  future: FirebaseDatabase.instance
                                      .reference()
                                      .child("Posts")
                                      .orderByChild("sid")
                                      .equalTo(widget.uid)
                                      .once(),
                                  builder: (context,
                                      AsyncSnapshot<DataSnapshot> snapshot) {
                                    if (!snapshot.hasData) {
                                      return Text("No data here!");
                                    }
                                    if (snapshot.hasError) {
                                      return Text(snapshot.error.toString());
                                    }
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      Map<dynamic, dynamic> values =
                                          snapshot.data.value;
                                      dataPost.clear();
                                      values.forEach((key, dat) {
                                        dataPost.add(dat);
                                      });
                                      print(
                                          "-----------------${dataPost.length}");
                                      return (dataPost.length != 0)
                                          ? GridView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount: dataPost.length,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                              ),
                                              itemBuilder: (context, ind) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                        builder: (_) =>
                                                            ViewImage(
                                                          image: dataPost[ind]
                                                                  ["image"]
                                                              .toString(),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Container(
                                                      height: 100,
                                                      child: Image.network(
                                                        dataPost[ind]["image"]
                                                            .toString(),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            )
                                          : Container();
                                    }
                                    return CircularProgressIndicator();
                                  }),
                              Container(child: Text("Reviews Here")),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Container()
              // if(widget.type == "Seller" && widget.officeGallery.length !=null)
              //
              // else
              //   Container(),
              // ( widget.type == "Seller"  )
              // ?GridView.builder(
              //   shrinkWrap: true,
              //     physics: NeverScrollableScrollPhysics(),
              //     itemCount: widget.officeGallery.length==null?0:widget.officeGallery.length,
              //     gridDelegate:
              //     SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2, ),
              //     itemBuilder: (context, index) {
              //       return Container(
              //         height: 100,
              //         child: Image.network(
              //             widget.officeGallery[index],
              //           fit: BoxFit.cover,),
              //       );
              //     },)
              //     : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
