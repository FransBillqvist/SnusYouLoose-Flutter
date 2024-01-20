import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StepTwoWidget extends StatefulWidget {
  final VoidCallback onDone;
  const StepTwoWidget({required this.onDone});

  @override
  State<StepTwoWidget> createState() => _StepTwoWidgetState();
}

class _StepTwoWidgetState extends State<StepTwoWidget> {
  DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoDatePicker(
          mode: CupertinoDatePickerMode.time,
          initialDateTime: _date,
          onDateTimeChanged: (DateTime newDate) {
            setState(() {
              _date = newDate;
            });
          },
        ),
        ElevatedButton(
          onPressed: widget.onDone,
          child: Text('Complete Step Two'),
        ),
      ],
    );
  }
}
