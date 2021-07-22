import 'package:flutter/material.dart';

class FriendTextFields extends StatefulWidget {
  final int index;
  final List optionslist;

  FriendTextFields({required this.index, required this.optionslist});
  @override
  _FriendTextFieldsState createState() => _FriendTextFieldsState();
}

class _FriendTextFieldsState extends State<FriendTextFields> {
  late TextEditingController optionController;

  @override
  void initState() {
    super.initState();
    optionController = TextEditingController();
  }

  @override
  void dispose() {
    optionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      optionController.text = widget.optionslist[widget.index];
    });

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 5,
              child: TextFormField(
                controller: optionController,
                onChanged: (v) => widget.optionslist[widget.index] = v,
                decoration: InputDecoration(hintText: 'Enter your option'),
                validator: (v) {
                  if (v!.trim().isEmpty) return 'Please enter your option';
                  return null;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
