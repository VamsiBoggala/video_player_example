import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../video_player_widget.dart';

class AssetPlayerWidget extends StatefulWidget {
  const AssetPlayerWidget({Key? key}) : super(key: key);

  @override
  _AssetPlayerWidgetState createState() => _AssetPlayerWidgetState();
}

class _AssetPlayerWidgetState extends State<AssetPlayerWidget> {
  final asset = 'assets/video.mp4';
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(asset)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => _controller.play());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMuted = _controller.value.volume == 0;

    return Column(
      children: [
        VideoPlayerWidget(controller: _controller),
        const SizedBox(height: 32),
        if (_controller != null && _controller.value.isInitialized)
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.red,
            child: IconButton(
              icon: Icon(
                isMuted ? Icons.volume_mute : Icons.volume_up,
                color: Colors.black,
              ),
              onPressed: () => _controller.setVolume(isMuted ? 1 : 0),
            ),
          )
      ],
    );
  }
}
