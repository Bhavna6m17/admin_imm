// import 'package:video_player/video_player.dart';
// import 'package:flutter/material.dart';
//
// void main() => runApp(VideoApp());
//
// class VideoApp extends StatefulWidget {
//   @override
//   _VideoAppState createState() => _VideoAppState();
// }
//
// class _VideoAppState extends State<VideoApp> {
//   VideoPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//         'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//       });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: '',
//       home: Scaffold(
//         body: Center(
//           child: _controller.value.initialized
//               ? AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: VideoPlayer(_controller),
//           )
//               : Container(),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             setState(() {
//               _controller.value.isPlaying
//                   ? _controller.pause()
//                   : _controller.play();
//             });
//           },
//           child: Icon(
//             _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ia_admin/constant/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoList extends StatefulWidget {
  const VideoList({Key key}) : super(key: key);

  @override
  _VideoListState createState() => _VideoListState();
}



class _VideoListState extends State<VideoList> {
  List<String> urls = [
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
  ];

  List<VideoPlayerController> _controllers = [];
  ImagePicker _videoPicker = ImagePicker();
  File _video;
  VideoPlayerController _videoPlayerController;
  addVideo() async {
   XFile pickedVideo = await _videoPicker.pickVideo(source: ImageSource.gallery);
    _video = File(pickedVideo.path);
   _videoPlayerController = VideoPlayerController.file(_video)
     ..initialize().then((_) {
       setState(() {});
       _videoPlayerController.play();
     });


  }

  @override
  void initState() {
    super.initState();
    urls.forEach((element) {
      _controllers.add(VideoPlayerController.network(element));
    });
  }

  void _playVideos() {
    _controllers.forEach((controller) {
      controller
        ..initialize().then((_) {
          setState(() {});
        });
      controller.value.isPlaying ? controller.pause() : controller.play();
    });
  }

  bool isVideosPlaying() {
    for (VideoPlayerController controller in _controllers) {
      if (controller.value.isPlaying) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(

      appBar: new AppBar(title: Text("Videos"),
      actions: [
        IconButton(onPressed: (){


        }, icon: Icon(Icons.more_vert),),
      ],
      backgroundColor: Colors.blue.shade900,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (ctx, index) {
          VideoPlayerController controller = _controllers[index];
          print(controller.value.isPlaying);
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: controller.value.isInitialized
                          ? AspectRatio(
                        aspectRatio: controller.value.aspectRatio,
                        child: VideoPlayer(controller),
                      )
                          : Container(),
                    ),
                    Container(
                      width: width,
                      color: kBlueColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Video Title",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: kWhiteColor,
                            ),
                            ),
                            Text(" Title",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: kWhiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: urls.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _playVideos();
          });
        },
        child: Icon(
          isVideosPlaying() ? Icons.pause : Icons.play_arrow,

        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controllers.forEach((controller) {
      controller.dispose();
    });
  }
}