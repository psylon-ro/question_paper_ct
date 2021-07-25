import 'package:flutter/material.dart';

String? dropdownValue = 'I-A';

/// This is the stateful widget that the main application instantiates.
class Dropdown extends StatefulWidget {
  final String? startname;
  final List<String> listt;
  Dropdown({this.startname, required this.listt});

  @override
  State<Dropdown> createState() => _Dropdown();
}

class _Dropdown extends State<Dropdown> {
  late String? dropdownValue;
  @override
  void initState() {
    dropdownValue = widget.startname;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //dropdownValue = widget.startname;
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: widget.listt.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
