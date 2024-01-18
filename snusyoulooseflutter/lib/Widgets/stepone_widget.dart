import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';

import '../Config/app_strings.dart';
import '../Styles/app_colors.dart';

class StepOneWidget extends StatefulWidget {
  final VoidCallback onDone;

  StepOneWidget({required this.onDone});

  @override
  _StepOneWidgetState createState() => _StepOneWidgetState();
}

class _StepOneWidgetState extends State<StepOneWidget> {
  Time _time = Time(hour: 05, minute: 30, second: 00);

  void onTimeChanged(Time newTime) {
    setState(() {
      _time = newTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(
            showPicker(
              context: context,
              value: _time,
              sunrise: TimeOfDay(hour: 5, minute: 30), // optional
              sunset: TimeOfDay(hour: 18, minute: 30), // optional
              duskSpanInMinutes: 120, // optional
              onChange: onTimeChanged,
              is24HrFormat: true,
            ),
          );
        },
        child: Text(
          "Open time picker",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
