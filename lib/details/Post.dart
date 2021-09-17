// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:ia_admin/Forms/PostStatus.dart';
//
// class Posts extends StatefulWidget {
//   @override
//   _PostsState createState() => _PostsState();
// }
//
// class _PostsState extends State<Posts> {
//   var db = FirebaseDatabase.instance.reference();
//   List dataSnap = [];
//
//   fetchData(){
//     db.child("Posts").once().then((DataSnapshot value) {
//       Map<dynamic,dynamic> data =value.value;
//       data.forEach((key, value) {
//         print("-----------${value["date"]}");
//       });
//
//
//     });
//   }
//   @override
//   void initState() {
//     fetchData();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Posts'),
//           backgroundColor: Colors.blue.shade900,
//         ),
//         body: FutureBuilder<DataSnapshot>(
//           future: db.child("Posts").once(),
//           builder: ( context,AsyncSnapshot<DataSnapshot> snapshot) {
//             if(!snapshot.hasData){
//               return Center(child: Text("No data here!"));
//             }
//             if(snapshot.hasError){
//               return Center(child: Text(snapshot.error.toString()));
//             }
//             if (snapshot.connectionState == ConnectionState.done) {
//               Map<dynamic, dynamic> values = snapshot.data.value;
//               values.forEach((key, dat) {
//                 dataSnap.add(dat);
//                 print("-----------${dataSnap[0]["sellerName"]}");
//               });
//               return GridView.builder(
//                 scrollDirection: Axis.vertical,
//                 shrinkWrap: true,
//                 gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300,
//                 childAspectRatio: 3/3,
//                 crossAxisSpacing: 20,
//                 mainAxisSpacing: 10,),
//                 itemBuilder: (context, index) {
//
//                   final image = dataSnap[index]["image"].toString();
//                   final sellerName = dataSnap[index]["sellerName"].toString();
//                   return  GestureDetector(
//                     onTap: (){
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => PostStatus(postImage: dataSnap[index]["image"].toString(),
//                             discription: dataSnap[index]["discription"].toString(),
//                             pid: dataSnap[index]["pid"].toString(),
//                             publisher: dataSnap[index]["publisher"].toString(),
//                           sellerEmail: dataSnap[index]["sellerEmail"].toString(),
//                             slogo: dataSnap[index]["slogo"].toString(),
//                             sellerAddress: dataSnap[index]["sellerAddress"].toString(),
//                             productState: dataSnap[index]["productState"].toString(),
//                             sellerPhone: dataSnap[index]["sellerPhone"].toString(),
//                             sellerName: dataSnap[index]["sellerName"].toString(),
//                           ),
//                         ),
//                       );
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8),
//                       child: Card(
//                         elevation: 1,
//                         child: Container(
//                           //height: height * 0.25,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Expanded(
//                                 flex:2,
//                                 child: Container(
//                                   // height: 50,
//                                   // width: 50,
//                                   child: Image.network(image,height: 100,),
//                                 ),
//                               ),
//                                // Divider(color: Colors.grey,),
//                                Padding(
//                                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
//                                  child: Container(
//                                     child: Text(sellerName,
//                                     style: TextStyle(
//                                       textBaseline: TextBaseline.alphabetic,
//                                       color: Colors.blue.shade900,
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                     ),
//                                   ),
//                                ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//
//                 itemCount: dataSnap.length,
//               );
//             }
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           },
//         ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  const Demo({Key key}) : super(key: key);

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 100,
          child: Card(
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/logo.jpeg")
                    )
                  ),
                ),
                Column(children: [
                  Text("anme"),
                  Text("Chandigarh"),
                  Row(
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.phone)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.message)),
                      ElevatedButton(onPressed: (){}, child: Text("View Detail"))
                    ],
                  )
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
