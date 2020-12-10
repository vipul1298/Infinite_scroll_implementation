import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoUI extends StatefulWidget {
  final String id;

  VideoUI({this.id});
  @override
  _VideoUIState createState() => _VideoUIState();
}

class _VideoUIState extends State<VideoUI> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
        initialVideoId: widget.id,
        flags: YoutubePlayerFlags(mute: false, autoPlay: false));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
    _controller.pause();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(),
          body: player,
        );
      },
      player: YoutubePlayer(
        bottomActions: [
          CurrentPosition(),
          ProgressBar(
            isExpanded: true,
          ),
          RemainingDuration()
        ],
        controller: _controller,
        showVideoProgressIndicator: true,
        onReady: () {
          print("Player is ready.");
        },
      ),
    );
  }
}
