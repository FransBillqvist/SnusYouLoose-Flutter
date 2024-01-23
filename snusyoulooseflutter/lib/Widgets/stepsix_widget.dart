import 'package:flutter/material.dart';

import '../Config/app_strings.dart';

class StepSixWidget extends StatefulWidget {
  const StepSixWidget({super.key});

  @override
  State<StepSixWidget> createState() => _StepSixWidgetState();
}

class _StepSixWidgetState extends State<StepSixWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Column(
        children: [
          Text(
            AppStrings.recapHabit,
            style: TextStyle(fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.quest2,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
