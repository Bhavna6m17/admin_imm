import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ia_admin/Models/PostModel.dart';

class VideoViewer extends StatefulWidget {
  const VideoViewer({Key key}) : super(key: key);

  @override
  _VideoViewerState createState() => _VideoViewerState();
}

class _VideoViewerState extends State<VideoViewer> {
  var db = FirebaseDatabase.instance.reference().child("BuyerPosts");
  var val;
  List listData = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: db.onValue,
        builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error));
          }
          //print("------${snapshot.data.snapshot.value}");
          if (snapshot.hasData &&
              (snapshot.connectionState == ConnectionState.active)) {
            db.onValue.listen((event) {
              var c = event.snapshot;
              print("-----$c");
            });
            Map<dynamic, dynamic> data = snapshot.data.snapshot.value;
            var docData = PostModel.fromSnapshot(snapshot.data.snapshot);
            print("=====${docData.address}");
            data.forEach((key, value) {
              val = value;
              listData.add(value);
            });
            return SingleChildScrollView(
              child: Container(
                child: Text(listData[0]["productState"] + listData[0]["name"]),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
