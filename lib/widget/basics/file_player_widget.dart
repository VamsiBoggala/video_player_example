import 'package:flutter/material.dart';

class FilePlayerWidget extends StatefulWidget {
  const FilePlayerWidget({Key? key}) : super(key: key);

  @override
  _FilePlayerWidgetState createState() => _FilePlayerWidgetState();
}

class _FilePlayerWidgetState extends State<FilePlayerWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('File format not supported in web'),
    );
  }
}
