import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../basic_overly_widget.dart';

class VideoPlayerFullscreenWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerFullscreenWidget({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget buildVideo() {
    return Stack(
      fit: StackFit.expand,
      children: [
        buildVideoPlayer(),
        BasicOverlayWidget(controller: controller),
      ],
    );
  }

  Widget buildVideoPlayer() {
    return buildFullScreen(
      child: AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: VideoPlayer(controller),
      ),
    );
  }

  Widget buildFullScreen({required Widget child}) {
    final size = controller.value.size;
    final width = size?.width ?? 0;
    final height = size?.height ?? 0;
    return FittedBox(
      fit: BoxFit.cover,
      child: SizedBox(
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}
