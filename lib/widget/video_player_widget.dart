import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_example/widget/basic_overly_widget.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerWidget({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller != null && controller.value.isInitialized
        ? Container(
            alignment: Alignment.topCenter,
            child: buildVideo(),
          )
        : Container(
            height: 200,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
  }

  Widget buildVideo() {
    return Stack(
      children: [
        buildVideoPlayer(),
        Positioned.fill(
          child: BasicOverlayWidget(
            controller: controller,
          ),
        ),
      ],
    );
  }

  Widget buildVideoPlayer() {
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller),
    );
  }
}
