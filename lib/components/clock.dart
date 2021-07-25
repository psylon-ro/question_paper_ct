import 'package:flutter/material.dart';

class Timee extends StatefulWidget {
  final String buttonname;
  Timee({required this.buttonname});
  @override
  _TimeeState createState() => _TimeeState();
}

class _TimeeState extends State<Timee> {
  TimeOfDay _time = new TimeOfDay(hour: 7, minute: 15);

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: SizedBox(
        width: 400,
        child: Container(
          alignment: Alignment.topLeft,
          child: Column(children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.deepPurple),
              ),
              onPressed: _selectTime,
              child: Text(widget.buttonname),
            ),
            SizedBox(height: 8),
            Text(
              'Selected time: ${_time.format(context)}',
            ),
          ]),
        ),
      ),
    );
  }
}
