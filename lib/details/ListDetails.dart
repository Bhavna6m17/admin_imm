import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ia_admin/Forms/UserDetails.dart';
import 'package:ia_admin/Models/UserModel.dart';
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
  int index;
  String user;



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


    // db.child("Users").orderByChild("type").equalTo("User").once().then((doc) {
    //    data =doc.value;
    //    List listData = data[""]
    //   data.forEach((element) {
    //     print("`````````````${element[0]["name"]}");
    //   });

      //print("==================${data.}");
     //  final docdata =doc.value.toList();
     //  docdata.forEach((element){
     //    print("==============================${element}");
     //
     //  });
     // doc.value.forEach((element) {
     //   print("=====================${element}");
     //   userList.add(element);
     // });
     // print("--------------${userList.length}");

    // });
  }
//Map<String,dynamic> data = Map<String,dynamic>();
  // Future<UserModel> getUserData()async{
  //   DataSnapshot dataSnapshot= await db.child("Users").orderByChild("type").equalTo("User").once();
  //   data = dataSnapshot.value;
  //   userModel =UserModel.fromJson(data);
  //   userList.add(userModel);
  //   return userModel;
  // }
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
          backgroundColor: Colors.blue.shade900,
          title: Text("Users Details",
            style: TextStyle(fontSize: 20,
                color: Colors.white),
          ),
        ),
      ),
      body: ListTile(
        title: FutureBuilder(
          future:db.child("Users").orderByChild("type").equalTo(widget.type).once(),

          builder: (context, AsyncSnapshot<DataSnapshot> snapshot){
            Map<dynamic, dynamic> values =snapshot.data.value;
            values.forEach((key, dat) {

              dataSnap.add(dat);

            });
          return GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetails(),
                ),
              );
            },
            child: ListView.builder(
              itemBuilder: (context,index){
                return Container(
                  height: 100,
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
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(

                                fit: BoxFit.cover,
                                scale: 1,
                                image:
                                dataSnap[index]["profileimage"].toString() == ""?
                                AssetImage('images/icons_person.png'):
                                  NetworkImage(dataSnap[index]["profileimage"]),
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
                                 width: 300.0,
                                   child: Text(dataSnap[index]["name"].toString().trimLeft()??" ",
                                overflow: TextOverflow.ellipsis,
                                 softWrap: false,
                                  maxLines: 1,
                                 style: TextStyle(fontSize: 20,

                                      color: Colors.blue.shade900),
                                ),
                                 ),
                                 Text(dataSnap[index]["email"]??" ",
                                   style: TextStyle(fontSize: 17,
                                       color: Colors.blue.shade900),
                                 ),
    ]
                             ),
                           ),


                                  //  Text("type:${dataSnap[index]["type"]}",
                                  //     style: TextStyle(fontSize: 20,
                                  //     color: Colors.blue.shade900,
                                  //     ),
                                  // ),
                            ],

                      ),
                    ),
                  ),
                ):Container(),);
              },
              itemCount: dataSnap.length,

            ),
          );
        },)
      ),

      // body: FutureBuilder(
      //     future: db.child('Users').orderByChild("type").equalTo('User').once(),
      //     builder: (context,snapshot){
      //       if(!snapshot.hasData){
      //         return Center(child: Text("No data here"),);
      //       }
      //
      //       if(snapshot.connectionState== ConnectionState.waiting){
      //         return Center(child: Text("Loading,..."));
      //       }
      //       // if(snapshot.hasData){
      //       //
      //       // }
      //       final users = UserModel.fromJson(
      //         Map<String, dynamic>.from(
      //             (snapshot.data as DataSnapshot).value
      //         ),
      //       );
      //       return ListView.builder(
      //           shrinkWrap: true,
      //           itemCount: userList.length,
      //           itemBuilder: (context,index) {
      //             return Center(child: Container(child: Text(users.user.name.toString())));
      //           });
      //       //return Container();
      //     }),
    );
  }
}
