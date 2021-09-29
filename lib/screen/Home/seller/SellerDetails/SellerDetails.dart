import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  @override
  void initState() {

   print("gal----------------${widget.officeGallery}");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
      body: Padding(
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
                                        child: Text("Cancel"),),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                enabled: false,
                initialValue:  widget.name ?? "null",
                decoration: InputDecoration(labelText: "Name"),

              ),
            ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          enabled: false,
          initialValue:  widget.phone ?? "null",
          decoration: InputDecoration(labelText: "Phone"),),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          enabled: false,
          initialValue:  widget.email ?? "null",
          decoration: InputDecoration(labelText: "Email"),),
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
            widget.type == "Seller"?
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text('Gallery',
              style: TextStyle(
                color: Colors.blue.shade900,
                fontSize: 20,
                  fontWeight: FontWeight.bold,
              ),)),
            ):Container(),
            (widget.type == "Seller")?
            FutureBuilder(
                future: FirebaseDatabase.instance.reference().child("Users").orderByChild("uid").equalTo(widget.uid).once(),
                builder:(context,AsyncSnapshot<DataSnapshot> snapshot){
              if(snapshot.hasError){
                return Center(child: Text(snapshot.error.toString()));
              }
              if(snapshot.connectionState == ConnectionState.done){
                Map<dynamic, dynamic> values =snapshot.data.value;
                values.forEach((key, dat) {

                  dataSnap.add(dat);

                });
                return (dataSnap[0]["officeGallery"].length != null)? GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:dataSnap[0]["officeGallery"].length,
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, ),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      child: Image.network(
                        dataSnap[0]["officeGallery"][index],
                        fit: BoxFit.cover,),
                    );
                  },):Container();
              }
              return Center(child: CircularProgressIndicator());
            } ):Container(),
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
    );
  }
}

class ViewImage extends StatelessWidget {
  final String image;
  const ViewImage({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(image),
          ),
        ),
      ),
    );
  }
}
