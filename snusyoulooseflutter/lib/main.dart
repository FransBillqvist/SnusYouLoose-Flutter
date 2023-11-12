import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Config/app_routes.dart';
import 'package:snusyoulooseflutter/Styles/app_colors.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Urbanist',
        scaffoldBackgroundColor: AppColors.example4,
        brightness: Brightness.dark,
      ),
      initialRoute: AppRoutes.login,
      routes: AppRoutes.pages,
    );
  }
}
