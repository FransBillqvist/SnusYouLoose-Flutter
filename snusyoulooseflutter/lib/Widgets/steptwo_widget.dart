import 'package:flutter/material.dart';

class StepTwoWidget extends StatefulWidget {
  final VoidCallback onDone;
  const StepTwoWidget({required this.onDone});

  @override
  State<StepTwoWidget> createState() => _StepTwoWidgetState();
}

class _StepTwoWidgetState extends State<StepTwoWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
