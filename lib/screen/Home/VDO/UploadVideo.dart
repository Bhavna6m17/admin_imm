import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ia_admin/constant/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadVideo extends StatefulWidget {
  const UploadVideo({Key key}) : super(key: key);

  @override
  _UploadVideoState createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  TextEditingController title;
  ImagePicker _videoPicker = ImagePicker();
  File _video;
  var dataSize;
  var videoUrl;
  VideoPlayerController _videoPlayerController;

  uploadVideoFx() async {
    TaskSnapshot snapshot = FirebaseStorage.instance
        .ref()
        .child("AdVideo")
        .putFile(_video)
        .snapshot;

    // if (snapshot.state == TaskState.running) {
    //   var size = snapshot.bytesTransferred.toDouble() / snapshot.totalBytes;
    //   setState(() {
    //     dataSize = size;
    //   });
    //   return runningDialouge();
    // }
    if (snapshot.state == TaskState.success) {
      videoUrl = await snapshot.ref.getDownloadURL().whenComplete(() {
        FirebaseDatabase.instance
            .reference()
            .child("AdVideo")
            .child(title.text)
            .set({
          "title": title.text.toString(),
          "link": videoUrl.toString()
        }).whenComplete(() {
          showSnackBar("Video Uploaded!");
          Navigator.pop(context);
        });
      });
    }
  }

  runningDialouge() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Center(
                child: Container(
              height: 100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(color: kBlueColor),
                  Text(dataSize.toString()),
                ],
              ),
            )),
          );
        });
  }

  pickVideo() async {
    XFile pickedVideo =
        await _videoPicker.pickVideo(source: ImageSource.gallery);
    _video = File(pickedVideo.path);
    _videoPlayerController = VideoPlayerController.file(_video)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlueColor,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              cursorColor: kBlueColor,
              controller: title,
              decoration: InputDecoration(
                hoverColor: kBlueColor,
                focusColor: kBlueColor,
                fillColor: kBlueColor,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                label: Text("Title of Video"),
              ),
            ),
          ),
          // ElevatedButton(onPressed: () {}, child: Text("Pick Video")),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  if (_video != null)
                    _videoPlayerController.value.isInitialized
                        ? AspectRatio(
                            aspectRatio:
                                _videoPlayerController.value.aspectRatio,
                            child: VideoPlayer(_videoPlayerController),
                          )
                        : Container()
                  else
                    Text(
                      "Click on Pick Video to select video",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  (_video == null)
                      ? ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => kBlueColor)),
                          onPressed: () {
                            pickVideo();
                          },
                          child: Text("Pick Video From Gallery"),
                        )
                      : ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => kBlueColor)),
                          onPressed: () {
                            pickVideo();
                          },
                          child: Text("Change Video"),
                        ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => kBlueColor)),
                    onPressed: () async {
                      //if (title.text == null) {
                      //  return showSnackBar("Please add tile!");
                      //}
                      if (_video == null) {
                        return showSnackBar("Please add Video!");
                      }
                      uploadVideoFx();
                    },
                    child: Text("Upload Video"),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
