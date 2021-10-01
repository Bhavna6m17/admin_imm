// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:ia_admin/Models/PostModel.dart';
//
// class Stream extends StatelessWidget {
//   var _firebaseRef = FirebaseDatabase().reference().child('BuyerPosts');
//   TextEditingController _txtCtrl = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: SafeArea(
//           child: Column(
//             children: <Widget>[
//               Container(
//                   child: Row(children: <Widget>[
//                     Expanded(child: TextField(controller: _txtCtrl)),
//                     SizedBox(
//                         width: 80,
//                         child: OutlinedButton(
//                             child: Text("Add"),
//                             onPressed: () {
//                               sendMessage();
//                             }))
//                   ])),
//               StreamBuilder(
//                 stream: _firebaseRef.onValue,
//                 builder: (context, snap) {
//                   if (snap.hasData &&
//                       !snap.hasError &&
//                       snap.data.snapshot.value != null) {
//                    var postModel = PostModel.fromJson(snap.data.snapshot.value);
//                    print("-------${postModel.productState
//                    }");
//                     Map data = snap.data.snapshot.value;
//                     List item = [];
//
//                     data.forEach(
//                             (index, data) => item.add({"key": index, ...data}));
//
//                     return Expanded(
//                       child: ListView.builder(
//                         itemCount: item.length,
//                         itemBuilder: (context, index) {
//                           return ListTile(
//                             title: Text(item[index]['message']),
//                           );
//                         },
//                       ),
//                     );
//                   } else
//                     return Center(child: Text("No data"));
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   sendMessage() {
//     _firebaseRef.push().set({
//       "message": _txtCtrl.text,
//       'time': DateTime
//           .now()
//           .millisecondsSinceEpoch
//     });
//   }
// }
