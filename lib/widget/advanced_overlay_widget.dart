import 'dart:js';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AdvancedOverlayWidget extends StatelessWidget {
  final VideoPlayerController controller;
  final VoidCallback onClickFullScreen;

  static const allSpeeds = <double>[0.25, 0.5, 1, 1.5, 2, 3, 5, 10];

  const AdvancedOverlayWidget({
    required this.controller,
    required this.onClickFullScreen,
    Key? key,
  }) : super(key: key);

  String getPosition() {
    final duration = Duration(
        milliseconds: controller.value.position.inMilliseconds.round());
    return [duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () =>
          controller.value.isPlaying ? controller.pause() : controller.play(),
      child: Stack(
        children: [
          buildPlay(),
          buildSpeed(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              children: [
                Expanded(
                  child: buildIndicator(),
                ),
                const SizedBox(
                  width: 12,
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.fullscreen,
                    color: Colors.black,
                    size: 28,
                  ),
                  onTap: onClickFullScreen,
                ),
                const SizedBox(width: 2),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildIndicator() {
    return Container(
      margin: const EdgeInsets.all(8).copyWith(right: 0),
      height: 16,
      child: VideoProgressIndicator(
        controller,
        allowScrubbing: true,
      ),
    );
  }

  Widget buildSpeed() {
    return Align(
      alignment: Alignment.topRight,
      child: PopupMenuButton<double>(
        initialValue: controller.value.playbackSpeed,
        tooltip: 'Playback speed',
        onSelected: controller.setPlaybackSpeed,
        itemBuilder: (context) => allSpeeds
            .map<PopupMenuEntry<double>>((speed) => PopupMenuItem(
                  value: speed,
                  child: Text('${speed}x'),
                ))
            .toList(),
        child: Container(
          color: Colors.black38,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text('${controller.value.playbackSpeed}x'),
        ),
      ),
    );
  }

  Widget buildPlay() {
    return AnimatedSwitcher(
      duration: const Duration(microseconds: 50),
      reverseDuration: const Duration(milliseconds: 200),
      child: controller.value.isPlaying
          ? Container()
          : Container(
              color: Colors.grey,
              child: const Center(
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.black,
                  size: 70,
                ),
              ),
            ),
    );
  }
}
