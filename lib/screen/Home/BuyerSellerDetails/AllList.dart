import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ia_admin/screen/Contacts/chat_page.dart';
import 'package:ia_admin/screen/Home/seller/SellerDetails/SellerDetails.dart';
import 'package:ia_admin/Models/UserModel.dart';
import 'package:url_launcher/url_launcher.dart';
class ListDetails extends StatefulWidget {
  final String type;

  const ListDetails({Key key, this.type}) : super(key: key);


  @override

  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<ListDetails> {
  List<UserModel> userList=[];
  UserModel userModel;
  String name;
 // int index;
  String user;
  String phoneNo;


  var dataa;
  DatabaseReference db = FirebaseDatabase.instance.reference();
  Map<String,dynamic> userSnapData = Map<String, dynamic>();

  getData(){

    db.child("Users").once().then((DataSnapshot snapshot){
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key,values) {
        dataa=values;
        print("=========${dataa["name"]}");
      }
      );
    }
    );
  }
  List dataSnap =[];
  Stream<UserModel> getSellerData() async* {
    db.child("Users").onValue.listen((event) {
      final data =new Map<String, dynamic>.from(event.snapshot.value);
       userModel =UserModel.fromJson(data);
      setState(() {
        userList.add(userModel);
        print("----------${userModel.name}");
      });
      return userModel;
    });

  }
  _makingPhoneCall(String phoneNo) async {
    String url = 'tel:$phoneNo';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  void initState() {
    getData();
    getSellerData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height
        child: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          backgroundColor: Colors.blue.shade900,
          title: Text("${widget.type} Details",
            style: TextStyle(fontSize: 20,
                color: Colors.white),
          ),
        ),
      ),
      body:
        FutureBuilder(
          future:db.child("Users").orderByChild("type").equalTo(widget.type).once(),

          builder: (context, AsyncSnapshot<DataSnapshot> snapshot){

          if(snapshot.connectionState == ConnectionState.done){
            Map<dynamic, dynamic> values =snapshot.data.value;
            values.forEach((key, dat) {

              dataSnap.add(dat);

            });
            return ListView.builder(
             // reverse: true,
              itemBuilder: (context,index){
                return Container(
                  height: 120,
                  child: (dataSnap[index]['type']==widget.type)?Container(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        // if you need this
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 80,
                                width: 150,
                                decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(0.3),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                    dataSnap[index]["profileimage"].toString() == ""?
                                    AssetImage('images/icons8-person-80.png'):
                                    NetworkImage(dataSnap[index]["profileimage"]),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10,0,0,10),
                              child:Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 250.0,
                                      child: Text(dataSnap[index]["name"].toString().trimLeft()??" ",
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
                                        maxLines: 1,
                                        style: TextStyle(fontSize: 22,
                                            fontWeight: FontWeight.bold,

                                            color: Colors.blue.shade900),
                                      ),
                                    ),
                                    Text(dataSnap[index]["address"]??" ",
                                      style: TextStyle(fontSize: 14,
                                          color: Colors.black,

                                      fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    //SizedBox(height: 3,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: (){
                                          _makingPhoneCall(dataSnap[index]['phone']);

                                        },
                                          icon:Icon(
                                            Icons.call,

                                            color: Colors.blue.shade900,
                                            size: 30,
                                          ),),

                                        // SizedBox(width: 20,),
                                        IconButton(onPressed: (){
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                              builder: (context) => ChatView(
                                                image: dataSnap[index]['profileimage'].toString(),
                                                name: dataSnap[index]['name'].toString(),
                                              ),),
                                          );
                                        },
                                          icon:Icon(
                                          Icons.message_sharp,
                                          color: Colors.blue.shade900,
                                          size: 30,
                                        ),),

                                        //SizedBox(width: 20,),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateColor.resolveWith(
                                                  (states) => Color(0xff0d47a1),),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(18.0),

                                          ),
                                            ),
                                          ),
                                          onPressed: () {

                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => UserDetails(
                                                    officeGallery: dataSnap[index]["officeGallery"],
                                                    uid:dataSnap[index]['uid'] ,
                                                    data: dataSnap,
                                                    type: widget.type,
                                                    email: dataSnap[index]['address'],
                                                    name: dataSnap[index]['name'],
                                                    phone: dataSnap[index]['phone'],
                                                    profileimg: dataSnap[index]['profileimage'].toString(),
                                                    description: dataSnap[index]["companyDiscription"].toString(),
                                                  ),
                                                ),
                                              );

                                          },
                                          child: Text("ViewDetails",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.white,
                                            // backgroundColor: Colors.blue.shade900,
                                          ),
                                          ),

                                        ),
                                        // Text('VeiwDetails',
                                        // style: TextStyle(
                                        //   color: Colors.blue.shade900,
                                        //   fontWeight: FontWeight.bold,
                                        //   fontSize: 20,
                                        // ),
                                        // ),
                                      ],
                                    ),
                                  ]
                              ),
                            ),
                            // Column(
                            //   children: [
                            //     Icon(
                            //       Icons.call,
                            //       color: Colors.blue.shade900,
                            //       size: 30,
                            //       // color: Colors.white,
                            //     ),
                            //     Icon(
                            //       Icons.message_sharp,
                            //       color: Colors.blue.shade900,
                            //       size: 30,
                            //       // color: Colors.white,
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ):Container(),);
              },
              itemCount: dataSnap.length,

            );
          }
          return Center(child: CircularProgressIndicator());

          },)


    );
  }
}
