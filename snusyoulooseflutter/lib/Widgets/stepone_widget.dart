import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Config/app_strings.dart';
import '../Styles/app_colors.dart';

class StepOneWidget extends StatefulWidget {
  final ValueChanged<DateTime> onMorningDateChanged;

  StepOneWidget({required this.onMorningDateChanged});
  @override
  _StepOneWidgetState createState() => _StepOneWidgetState();
}

class _StepOneWidgetState extends State<StepOneWidget> {
  DateTime _date = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 5, 30);
  DateTime _selectedDate = DateTime.now();

  void _onDateChanged(DateTime newDate) {
    widget.onMorningDateChanged(newDate);
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

//   void onTimeChanged(Time newTime) {
//     setState(() {
//       _time = newTime;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _showTimePicker();
//     });
//   }

//   void _showTimePicker() {
//     Navigator.of(context).push(
//       showPicker(
//         context: context,
//         value: _time,
//         sunrise: TimeOfDay(hour: 5, minute: 30), // optional
//         sunset: TimeOfDay(hour: 18, minute: 30), // optional
//         duskSpanInMinutes: 120, // optional
//         onChange: onTimeChanged,
//         is24HrFormat: true,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 20),
//       child: TextButton(
//         onPressed: _showTimePicker,
//         child: Column(
//           children: [
//             Text(
//               "Open time picker",
//               style: TextStyle(color: Colors.white),
//             ),
//             ElevatedButton(
//               onPressed: widget.onDone,
//               child: Text('Complete Step One'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
