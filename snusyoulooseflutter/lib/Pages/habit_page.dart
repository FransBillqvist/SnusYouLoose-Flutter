import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Styles/app_colors.dart';

class HabitPage extends StatelessWidget {
  const HabitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Habit Page",
          style: TextStyle(color: AppColors.example1),
        ),
      ),
    );
  }
}
