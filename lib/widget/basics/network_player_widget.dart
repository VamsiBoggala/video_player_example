import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../other/floating_action_button_widget.dart';
import '../other/textField_widget.dart';
import '../video_player_widget.dart';

import '../../main.dart';

class NewtworkPlayerWidget extends StatefulWidget {
  const NewtworkPlayerWidget({Key? key}) : super(key: key);

  @override
  _NewtworkPlayerWidgetState createState() => _NewtworkPlayerWidgetState();
}

class _NewtworkPlayerWidgetState extends State<NewtworkPlayerWidget> {
  final textController = TextEditingController(text: urlLandscapeVideo);
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(textController.text)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          VideoPlayerWidget(controller: controller),
          buildTextField(),
        ],
      ),
    );
  }

  Widget buildTextField() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: TextFieldWidget(
              controller: textController,
              hintText: 'Enter Video Url',
            ),
          ),
          const SizedBox(width: 12),
          FloatingActionButtonWidget(
            onPressed: () {
              if (textController.text.trim().isEmpty) {
                return;
              }
            },
          )
        ],
      ),
    );
  }
}
