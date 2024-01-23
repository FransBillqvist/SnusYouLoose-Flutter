import 'package:flutter/material.dart';

class StepFiveWidget extends StatefulWidget {
  final ValueChanged<dynamic> onFinalChanged;
  final int stepIndecator;

  StepFiveWidget({required this.onFinalChanged, required this.stepIndecator});

  @override
  State<StepFiveWidget> createState() => _StepFiveWidgetState();
}

class _StepFiveWidgetState extends State<StepFiveWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
