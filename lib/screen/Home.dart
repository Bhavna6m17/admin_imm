import 'package:flutter/material.dart';
import 'package:ia_admin/Forms/SellerForm.dart';
import 'package:ia_admin/Models/UserModel.dart';
import 'package:ia_admin/details/Events.dart';
import 'package:ia_admin/details/HotArea.dart';
import 'package:ia_admin/details/IletStudy.dart';
import 'package:ia_admin/details/MyMatch.dart';
import 'package:ia_admin/details/Plan.dart';
import 'package:ia_admin/details/Post.dart';
import 'package:ia_admin/details/ListDetails.dart';
import 'package:ia_admin/screen/LoginScreen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:responsive_builder/responsive_builder.dart';
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserModel userModel;
  List<UserModel> userList=[];
  DatabaseReference db = FirebaseDatabase.instance.reference();
  var dataa;
  Map<dynamic, dynamic> docData;
  putdata(){
    db.child("path").push().set({
      "name":"Immigtaion Adda"
    }).whenComplete(() => print("-------------add added ")).catchError((onError){
      print("==================$onError");
    }).onError((error, stackTrace) => print("````````````````$error"));
  }
  readData(){
    db.child("Users").once().then((value) => print("``````````============``````````${value.value}"));
  }

 Future<void> getData() async {

   await db.child("Users").orderByChild("uid").equalTo("6lOVecgdWYU7oyjxvpT5s5ErIpg1").once().then((DataSnapshot snapshot){
     Map<dynamic, dynamic> values = snapshot.value;
     values.forEach((key,values) {
       dataa=values;
       print("------------------${dataa["name"]}");
     }
     );
   }
   );
 }
  @override
  void initState() {
   getData();
    // TODO: implement initState
    super.initState();


//    print("============$dataa");
  }


  @override
  Widget build(BuildContext context) {
    
    return ScreenTypeLayout(
    mobile:MobileHome(),desktop:DesktopHome() ,
    );
  }
}
class MobileHome extends StatelessWidget {
  const MobileHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0), // here the desired height
          child: AppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.all(4.0),
              child: CircleAvatar (
                backgroundImage: AssetImage("images/logo.jpeg"),
              ),
            ),
            backgroundColor: Color(0xff0d47a1),
            title: Text(
              "Immigration Adda",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // TextButton(onPressed: (){
              //   print("button pressed!");
              //   putdata();
              // }, child: Text("Admin Panel",
              // style: TextStyle(fontSize: 20,
              // fontStyle: (FontStyle.italic),
              //   color: Colors.black,
              // ),
              // ),),
              GridView.count(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 1.2,
                mainAxisSpacing: 5,
                shrinkWrap: true,
                crossAxisCount: 2,
                padding: EdgeInsets.all(10),
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListDetails(type: "Seller",),
                        ),
                      );
                    },
                    child: Card(
                      color: Color(0xff0d47a1),
                      margin:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        // if you need this
                        side: BorderSide(
                          color: Colors.white10,
                          width: 0.4,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sell_rounded,
                            size: 30,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Container(
                              child: Center(
                                child: Text(
                                  "Seller Details",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              // width: 200,
                              // height: 180,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListDetails(type: "User",),
                        ),
                      );
                    },
                    child: Card(
                      margin:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        // if you need this
                        side: BorderSide(
                          color: Colors.white10,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            size: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:5 ),
                            child: Container(
                              child: Center(
                                child: Text(
                                  "User Details",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              // width: 200,
                              // height: 200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) {
                              return
                                Events();
                            }
                        ),
                      );
                    },
                    child: Card(
                      margin:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        side: BorderSide(
                          color: Colors.white10,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.event,
                            size: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Container(
                              child: Center(
                                child: Text(
                                  "Event",
                                  style: TextStyle(
                                    fontSize: 16
                                    ,
                                  ),
                                ),
                              ),
                              // width: 200,
                              // height: 100,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Posts(),
                        ),
                      );
                    },
                    child: Card(
                      color: Color(0xff0d47a1),
                      margin:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 10),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        // if you need this
                        side: BorderSide(
                          color: Colors.white10,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.post_add,
                            size: 30,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Container(
                              child: Center(
                                child: Text(
                                  "Post",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              // width: 200,
                              // height: 200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Study(),
                        ),
                      );
                    },
                    child: Card(
                      color: Color(0xff0d47a1),
                      margin:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        // if you need this
                        side: BorderSide(
                          color: Colors.white10,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.class__outlined,
                            size: 30,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Container(
                              child: Center(
                                child: Text(
                                  "IELTS Classes",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              // width: 200,
                              // height: 200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Study(),
                        ),
                      );
                    },
                    child: Card(

                      margin:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        // if you need this
                        side: BorderSide(
                          color: Colors.white10,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.text_snippet_rounded,
                            size: 30,

                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Container(
                              child: Center(
                                child: Text(
                                  "IELTS Test",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              // width: 200,
                              // height: 200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>Study(),
                        ),
                      );
                    },
                    child: Card(
                      margin:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        // if you need this
                        side: BorderSide(
                          width: 1,
                          color: Colors.white10,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.book,
                            size: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Container(
                              child: Center(
                                child: Text(
                                  "IELTS Data",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              // width: 200,
                              // height: 200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Plans(),
                        ),
                      );
                    },
                    child: Card(
                      color: Color(0xff0d47a1),
                      margin:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 10),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        // if you need this
                        side: BorderSide(
                          width: 1,
                          color: Colors.white10,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.book,
                            size: 30,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Container(
                              child: Center(
                                child: Text(
                                  "Plans",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              // width: 200,
                              // height: 200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyMatch(),
                        ),
                      );
                    },
                    child: Card(
                      color: Color(0xff0d47a1),
                      margin:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        // if you need this
                        side: BorderSide(
                          color: Colors.white10,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.mail_outline_rounded,
                            size: 30,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Container(
                              child: Center(
                                child: Text(
                                  "My Match",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              // width: 200,
                              // height: 200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HotAreas(),
                        ),
                      );
                    },
                    child: Card(
                      margin:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        // if you need this
                        side: BorderSide(
                          color: Colors.white10,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.map,
                            size: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Container(
                              child: Center(
                                child: Text(
                                  "Hot Area Target",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              // width: 200,
                              // height: 200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // Spacer(
              //   flex: 1,
              // ),
              Padding(padding: EdgeInsets.all(8),
                child:  Container(
                  height: 50,width: 130,
                  //color: Color(0xff0d47a1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(

                        backgroundColor: MaterialStateColor.resolveWith((states) => Color(0xff0d47a1))
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },

                    child: Text("Log Out",
                      style: TextStyle(color: Colors.white,
                          fontSize: 20
                      ),
                    ),
                  ),
                ),),
            ],
          ),
        ),
      ),
    );
  }
}

class DesktopHome extends StatelessWidget {
  const DesktopHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0), // here the desired height
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(4.0),
              child: CircleAvatar (
                backgroundImage: AssetImage("images/logo.jpeg"),
              ),
            ),
            backgroundColor: Color(0xff0d47a1),
            title: Text(
              "Immigration Adda",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // TextButton(onPressed: (){
              //   print("button pressed!");
              //   putdata();
              // }, child: Text("Admin Panel",
              // style: TextStyle(fontSize: 20,
              // fontStyle: (FontStyle.italic),
              //   color: Colors.black,
              // ),
              // ),),
              GridView.count(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 1.2,
                mainAxisSpacing: 5,
                shrinkWrap: true,
                crossAxisCount: 5,
                padding: EdgeInsets.all(10),
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListDetails(type: "Seller",),
                        ),
                      );
                    },
                    child: Card(
                      color: Color(0xff0d47a1),
                      margin:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        // if you need this
                        side: BorderSide(

                          width: 0.5,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sell_rounded,
                            size: 40,
                            color: Colors.white,
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                "Seller Details",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            // width: 200,
                            // height: 180,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListDetails(type: "User",),
                        ),
                      );
                    },
                    child: Card(
                      margin:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        // if you need this
                        side: BorderSide(
                          color: Colors.blue.shade900,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            size: 40,
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                "User Details",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            // width: 200,
                            // height: 200,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) {
                              return
                                Events();
                            }
                        ),
                      );
                    },
                    child: Card(
                      margin:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        side: BorderSide(
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.event,
                            size: 40,
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                "Event",
                                style: TextStyle(
                                  fontSize: 16
                                  ,
                                ),
                              ),
                            ),
                            // width: 200,
                            // height: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Posts(),
                        ),
                      );
                    },
                    child: Card(
                      color: Color(0xff0d47a1),
                      margin:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 10),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        // if you need this
                        side: BorderSide(
                          color: Colors.blue.shade900,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.post_add,
                            size: 40,
                            color: Colors.white,
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                "Post",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            // width: 200,
                            // height: 200,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Study(),
                        ),
                      );
                    },
                    child: Card(
                      color: Color(0xff0d47a1),
                      margin:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        // if you need this
                        side: BorderSide(
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.class__outlined,
                            size: 40,
                            color: Colors.white,
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                "IELTS Classes",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            // width: 200,
                            // height: 200,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Study(),
                        ),
                      );
                    },
                    child: Card(

                      margin:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        // if you need this
                        side: BorderSide(
                          color: Colors.blue.shade900,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.text_snippet_rounded,
                            size: 40,

                          ),
                          Container(
                            child: Center(
                              child: Text(
                                "IELTS Test",
                                style: TextStyle(

                                  fontSize: 16,
                                ),
                              ),
                            ),
                            // width: 200,
                            // height: 200,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Study(),
                        ),
                      );
                    },
                    child: Card(
                      margin:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        // if you need this
                        side: BorderSide(
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.book,
                            size: 40,
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                "IELTS Data",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            // width: 200,
                            // height: 200,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Plans(),
                        ),
                      );
                    },
                    child: Card(
                      color: Color(0xff0d47a1),
                      margin:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 10),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        // if you need this
                        side: BorderSide(
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.book,
                            size: 40,
                            color: Colors.white,
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                "Plans",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            // width: 200,
                            // height: 200,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyMatch(),
                        ),
                      );
                    },
                    child: Card(
                      color: Color(0xff0d47a1),
                      margin:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        // if you need this
                        side: BorderSide(
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.mail_outline_rounded,
                            size: 40,
                            color: Colors.white,
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                "My Match",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            // width: 200,
                            // height: 200,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HotAreas(),
                        ),
                      );
                    },
                    child: Card(
                      margin:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        // if you need this
                        side: BorderSide(
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.map,
                            size: 40,
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                "Hot Area Target",
                                style: TextStyle(
                                  fontSize: 16 ,
                                ),
                              ),
                            ),
                            // width: 200,
                            // height: 200,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // Spacer(
              //   flex: 1,
              // ),
              Padding(padding: EdgeInsets.all(8),
                child:  Container(
                  height: 50,width: 130,
                  //color: Color(0xff0d47a1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith((states) => Color(0xff0d47a1),),
                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                    ),
    ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },

                    child: Text("Log Out",
                      style: TextStyle(color: Colors.white,
                          fontSize: 18
                      ),
                    ),
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
