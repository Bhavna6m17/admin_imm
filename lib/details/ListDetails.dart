import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
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
 // int index;
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
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetails(
                          uid:dataSnap[index]['uid'] ,
                          data: dataSnap,
                          type: widget.type,
                          email: dataSnap[index]['email'],
                          name: dataSnap[index]['name'],
                          phone: dataSnap[index]['phone'],
                          profileimg: dataSnap[index]['profileimage'].toString(),
                          description: dataSnap[index]["companyDiscription"].toString(),
                   ),
                      ),
                    );
                  },
                  child: Container(
                    height: 80,
                    child: (dataSnap[index]['type']==widget.type)?Container(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          // if you need this
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Expanded(
                            flex:1,
                            child: Row(
                              children: [
                                Expanded(
                                  flex:1,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
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
                                            style: TextStyle(fontSize: 18,

                                                color: Colors.blue.shade900),
                                          ),
                                        ),
                                        Text(dataSnap[index]["email"]??" ",
                                          style: TextStyle(fontSize: 18,
                                              color: Colors.blue.shade900),
                                        ),
                                      ]
                                  ),
                                ),
                              ],

                            ),
                          ),
                        ),
                      ),
                    ):Container(),),
                );
              },
              itemCount: dataSnap.length,

            );
          }
          return Center(child: CircularProgressIndicator());

          },)


    );
  }
}
