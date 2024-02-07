import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:snusyoulooseflutter/Services/app_services.dart';

class SnuffWatchWidget extends StatefulWidget {
  const SnuffWatchWidget({super.key});

  @override
  State<SnuffWatchWidget> createState() => _SnuffWatchWidgetState();
}

class _SnuffWatchWidgetState extends State<SnuffWatchWidget> {
  @override
  Widget build(BuildContext context) {
    final userId = getUserIdService(context);
    return FutureBuilder(
      future: fetchTimeToNextDose(userId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show a loading spinner while waiting
        } else if (snapshot.hasError) {
          return Text(
              'Error: ${snapshot.error}'); // Show error if something went wrong
        } else {
          final timeLeft = snapshot.data;
          print('IN RETURN FOR WATCH'); // The data is available here
          return SlideCountdown(
              duration: timeLeft,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ));
        }
      },
    );
  }
}
