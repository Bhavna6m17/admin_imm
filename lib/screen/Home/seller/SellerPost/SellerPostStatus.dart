import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ia_admin/constant/constants.dart';

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
      this.sellerName, this.image, time, date, specialization, certficates, String plan, this.qualification})
      : super(key: key);

  @override
  _PostStatusState createState() => _PostStatusState();

}

class _PostStatusState extends State<PostStatus> {
  var db = FirebaseDatabase.instance.reference();
  showSnackBar(String message){
    final snackBar= SnackBar(content: Text(message),);
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
    double width= MediaQuery.of(context).size.width;
    return DefaultTabController(
      length:5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.sellerName),
          backgroundColor: kBlueColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder(
                stream:  FirebaseDatabase.instance
                    .reference()
                    .child("Posts")
                    .child(widget.pid)
                    .onValue,
                builder: (context,AsyncSnapshot<Event> snapshot) {
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
                                    backgroundColor: MaterialStateColor.resolveWith(
                                      (states) => Color(0xff0d47a1),
                                    ),
                                    shape:
                                        MaterialStateProperty.all<RoundedRectangleBorder>(
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
                                width: 10,
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
                                    shape:
                                        MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    updateUnApprovePost();
                                  },
                                  child: Text(
                                    "Unapproved",
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
                                    shape:
                                        MaterialStateProperty.all<RoundedRectangleBorder>(
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
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Post Status: ${ snapshot.data.snapshot.value["productState"]}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(widget.postImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Seller Details",
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

                                    Flexible(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                           Divider(color: Colors.grey,),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text('Phone no.',
                                              style: TextStyle(
                                                color: kBlueColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              widget.sellerPhone,
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Divider(color: Colors.grey,),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text('Qualification',
                                              style: TextStyle(
                                                color: kBlueColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              widget.qualification,
                                              textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                           Divider(color: Colors.grey,),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text('Email',
                                              style: TextStyle(
                                                color: kBlueColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              widget.sellerEmail,
                                              textDirection: TextDirection.ltr,
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
                                            child: Text('Description',
                                              style: TextStyle(
                                                color: kBlueColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              widget.discription??"",
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
                              height:50,
                              child:AppBar(
                                bottom:TabBar(
                                  tabs:[
                                    Tab(icon:Icon(Icons.photo),text: "Gallery",),
                                    Tab(icon:Icon(Icons.document_scanner_sharp),text:"Certificate"),
                                    Tab(icon:Icon(Icons.phonelink_setup_rounded),text:"Posts"),
                                    Tab(icon:Icon(Icons.comment),text:"Reviews"),
                                    Tab(icon:Icon(Icons.money),text:"plan"),
                                  ],
                                )
                              ),
                            ),
                            Expanded(
                              flex:3,
                              child:TabBarView(
                                children: [
                                  Container(child:Text("gallery Here")),
                                  Container(child:Text("certfiv Here")),
                                  Container(child:Text("posts Here")),
                                  Container(child:Text("e=review Here")),
                                  Container(child:Text("plan Here")),
                                ],
                              )
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(width: 20),
                                Container(
                                  height: 80,
                                  width: width,
                                  child: Card(

                                    child: Center(
                                      child: Text(
                                        "Plans",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Container(
                                  height: 80,
                                  width: width,
                                  child: Card(
                                    child: Center(
                                      child: Text(
                                          "Gallery",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Container(
                                  height: 80,
                                  width: width,
                                  child: Card(
                                    child: Center(
                                      child: Text(
                                          'Certification',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                          color: kBlueColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Container(
                                  height: 80,
                                  width: width,
                                  child: Card(
                                    child: Center(
                                      child: Text(
                                          "Location",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22
                                    ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              ),
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
                child: Text('fruits', style: TextStyle(color: kBlueColor
                )),
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