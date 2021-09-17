import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ia_admin/Forms/BuyerPost.dart';
import 'package:ia_admin/Forms/SellerPost.dart';
import 'package:ia_admin/Models/UserModel.dart';
import 'package:ia_admin/constant/constants.dart';
import 'package:ia_admin/details/Events.dart';
import 'package:ia_admin/details/HotArea.dart';
import 'package:ia_admin/details/IletStudy.dart';
import 'package:ia_admin/details/MyMatch.dart';
import 'package:ia_admin/details/Plan.dart';
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
     double height = MediaQuery.of(context).size.height;
    return  MaterialApp(
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff0d47a1),
                ),
                child: Text(
                  "Immigration Adda",
                  style: TextStyle(fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              ListTile(
                title: const Text('Profile'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('Posts'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
       appBar: AppBar(

        ),
        body: SafeArea(

          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height*0.2,
                  decoration: BoxDecoration(
                    color: Color(0xff0d47a1),
                  ),
                  child: Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: CircleAvatar (radius: 45,

                            backgroundImage: AssetImage("images/logo.jpeg",
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                "Immigration Adda",
                                style: TextStyle(fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 5,),
                        IconButton(
                          onPressed: (){},
                          icon: Icon(
                            Icons.edit,
                            size: 25,
                            color: Colors.white,
                            // color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text("Admin Panel",
                style: TextStyle(fontSize: 30,
                  // fontFamily: 'RobotoMono',
                  fontWeight: FontWeight.bold,
                fontStyle: (FontStyle.italic),
                  color: Colors.black,
                ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Divider(color: Colors.blue.shade900,
                    thickness: 2,
                  ),
                ),
                GridView.count(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.2,
                  mainAxisSpacing: 5,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(10),
                  children: [
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => SellerPost(),
                    //       ),
                    //     );
                    //   },
                    //   child: Card(
                    //     color: Color(0xff0d47a1),
                    //     margin:
                    //     EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                    //
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(20),
                    //       // if you need this
                    //       side: BorderSide(
                    //         color: Colors.white10,
                    //         width: 1,
                    //       ),
                    //     ),
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Icon(
                    //           Icons.post_add,
                    //           size: 30,
                    //           color: Colors.white,
                    //         ),
                    //         Padding(
                    //           padding: const EdgeInsets.only(top: 5),
                    //           child: Container(
                    //             child: Center(
                    //               child: Text(
                    //                 "Seller Panel",
                    //                 style: TextStyle(
                    //                   color: Colors.white,
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize: 22,
                    //                 ),
                    //               ),
                    //             ),
                    //             // width: 200,
                    //             // height: 200,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    FeaturedList(onTap: (){

                    }, title: 'Seller Panel', icon: Icons.sell_sharp, textColor: kBlueColor, boxColor: kWhiteColor, iconColor: kWhiteColor),
                    FeaturedList(onTap: (){

                    }, title: 'Buyer Panel', icon: Icons.note_add_sharp, textColor: kBlueColor, boxColor: kWhiteColor, iconColor: kBlueColor),
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
                        // color: Color(0xff0d47a1),
                        margin:
                        EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
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
                              // color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Container(
                                child: Center(
                                  child: Text(
                                    "Seller Details",
                                    style: TextStyle(
                                      color: Colors.blue.shade900,
                                      // color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
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
                        color: Color(0xff0d47a1),
                        margin:
                        EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
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
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:5 ),
                              child: Container(
                                child: Center(
                                  child: Text(
                                    "User Details",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
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
                            builder: (context) => SellerPost(),
                          ),
                        );
                      },
                      child: Card(
                        color: Color(0xff0d47a1),
                        margin:
                        EdgeInsets.symmetric(vertical: 16, horizontal: 10),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
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
                                    "Seller Post",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
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
                            builder: (context) => BuyerPost(),
                          ),
                        );
                      },
                      child: Card(
                        margin:
                        EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
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
                                    "Buyer Post",
                                    style: TextStyle(
                                      color: Colors.blue.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
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
                          borderRadius: BorderRadius.circular(20),
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
                                      color: Colors.blue.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22
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
                            builder: (context) => ListDetails(),
                          ),
                        );
                      },
                      child: Card(
                        color: Color(0xff0d47a1),
                        margin:
                        EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
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
                              Icons.video_call_sharp,
                              size: 30,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:5 ),
                              child: Container(
                                child: Center(
                                  child: Text(
                                    "Video",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 22,
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
                          borderRadius: BorderRadius.circular(20),
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
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
                          borderRadius: BorderRadius.circular(20),
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
                                      color: Colors.blue.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
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
                          borderRadius: BorderRadius.circular(20),
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
                              color: Colors.blue.shade900,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Container(
                                child: Center(
                                  child: Text(
                                    "IELTS Data",
                                    style: TextStyle(
                                      color: Colors.blue.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
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
                          borderRadius: BorderRadius.circular(20),
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
                                      fontSize: 22,
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
                          borderRadius: BorderRadius.circular(20),
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
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
                          borderRadius: BorderRadius.circular(20),
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
                              padding: const EdgeInsets.only(top: 2),
                              child: Container(
                                child: Center(
                                  child: Text(
                                    "Target Area ",
                                    style: TextStyle(
                                      color: Colors.blue.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
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

                  ),
                ),
              ],
            ),
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
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
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
                            color: Colors.white,
                            size: 40,
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                "User Details",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
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
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
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
                          builder: (context) => SellerPost(),
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
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
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
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
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
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
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
                            color: Colors.blue.shade900,
                            size: 40,
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                "IELTS Data",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.blue.shade900,
                                  fontWeight: FontWeight.bold,
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
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
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
                  FeaturedList(onTap: (){

                  }, title: 'My Match', icon: Icons.map, textColor: kWhiteColor, boxColor: kBlueColor, iconColor: kWhiteColor),
                  FeaturedList(onTap: (){

                  }, title: "Hot Area ", icon: Icons.description, textColor: kWhiteColor, boxColor: kBlueColor, iconColor: kWhiteColor),
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
                            child: Text(
                              "Hot Area Target ",

                              style: TextStyle(
                                fontSize: 22 ,
                                fontWeight: FontWeight.bold,
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
                          fontWeight: FontWeight.bold,
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
class FeaturedList extends StatelessWidget {
  final Color textColor;
  final Color boxColor;
  final Color iconColor;
  final Function onTap;
  final String title;
  final IconData icon;
  const FeaturedList({Key key,@required this.onTap,@required this.title,@required this.icon,@required this.textColor,@required this.boxColor,@required this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin:
        EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          // if you need this
          side: BorderSide(
            width: 1,
            color: boxColor,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: iconColor,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
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
    );
  }
}
