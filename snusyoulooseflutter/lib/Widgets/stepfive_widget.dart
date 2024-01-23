import 'package:flutter/material.dart';

import '../Config/app_strings.dart';

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
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 300,
        child: Padding(
          padding: EdgeInsets.only(right: 16.0, left: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (widget.stepIndecator == 4)
                Container(
                  child: Text(AppStrings.infoAppMode),
                ),
              if (widget.stepIndecator == 5)
                Container(
                  child: Text(
                    AppStrings.infoDateMode,
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
