import 'package:flutter/material.dart';

class Alertboxx extends StatelessWidget {
  final onrightbuttonpressed;
  final onleftbuttonpressed;

  Alertboxx(
      {required this.onleftbuttonpressed, required this.onrightbuttonpressed});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Submit this question paper?'),
      content: const Text('This will save the questions from your device.'),
      actions: <Widget>[
        TextButton(child: const Text('Cancel'), onPressed: onleftbuttonpressed),
        TextButton(child: const Text('Submit'), onPressed: onrightbuttonpressed)
      ],
    );
  }
}
