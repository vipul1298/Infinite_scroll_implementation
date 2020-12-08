import 'package:flutter/material.dart';
import 'package:video_box/video.controller.dart';
import 'package:video_player/video_player.dart';
import 'package:video_box/video_box.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<VideoController> vcs = [];

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < 4; i++) {
      vcs.add(VideoController(
          source: VideoPlayerController.network(
              "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4"))
        ..initialize());
    }
  }

  @override
  void dispose() {
    for (var vc in vcs) {
      vc.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Page 2"),
        ),
        body: ListView(
          children: [
            for (var vc in vcs)
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: VideoBox(controller: vc),
                ),
              ),
          ],
        ));
  }
}
