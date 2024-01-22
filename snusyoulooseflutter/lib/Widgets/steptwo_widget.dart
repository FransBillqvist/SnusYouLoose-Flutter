import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StepTwoWidget extends StatefulWidget {
  final ValueChanged<DateTime> onDateChanged;
  StepTwoWidget({required this.onDateChanged});

  @override
  State<StepTwoWidget> createState() => _StepTwoWidgetState();
}

class _StepTwoWidgetState extends State<StepTwoWidget> {
  DateTime _date = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 22, 30);
  DateTime _selectedDate = DateTime.now();

  void _onDateChanged(DateTime newDate) {
    widget.onDateChanged(newDate);
    setState(() {
      _selectedDate = newDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.time,
        use24hFormat: true,
        initialDateTime: _date,
        onDateTimeChanged: (newDate) {
          _onDateChanged(newDate);
        },
      ),
    );
  }
}
