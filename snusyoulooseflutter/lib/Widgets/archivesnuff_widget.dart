import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Services/app_services.dart';

import '../Pages/home_page.dart';

class ArchiveSnuffWidget extends StatelessWidget {
  final String CurrentSnuffId;

  ArchiveSnuffWidget({required this.CurrentSnuffId});

  @override
  Widget build(BuildContext context) {
    inspect(CurrentSnuffId);
    return FutureBuilder<bool>(
      future: postCurrentSnuffToArchive(CurrentSnuffId),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show a loading spinner while waiting for the API call to finish
        } else if (snapshot.hasError) {
          return Text(
              'Error: ${snapshot.error}'); // Show an error message if the API call failed
        } else if (snapshot.hasData && snapshot.data == true) {
          return HomePage(); // Render HomePage if the API call returned true
        } else {
          return Container(); // Render an empty Container if the API call returned false
        }
      },
    );
  }
}
