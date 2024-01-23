import 'package:flutter/material.dart';

import '../Config/app_strings.dart';
import '../Styles/app_colors.dart';

class StepFiveWidget extends StatefulWidget {
  final ValueChanged<dynamic> onFinalChanged;
  final int stepIndecator;

  StepFiveWidget({required this.onFinalChanged, required this.stepIndecator});

  @override
  State<StepFiveWidget> createState() => _StepFiveWidgetState();
}

class _StepFiveWidgetState extends State<StepFiveWidget> {
  double value = 0.5;
  late int valueAsInt;
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
                  child: Column(
                    children: [
                      Text(AppStrings.infoAppMode),
                      Padding(padding: EdgeInsets.only(top: 42.0)),
                      Text(
                        valueAsInt.toString(),
                        style: TextStyle(
                            color: AppColors.loginDeepBackgroundColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ), // Define the value variable with an initial value
                      Slider(
                          min: 0.1,
                          max: 1.0,
                          value: value,
                          onChanged: (newValue) {
                            setState(() {
                              value = newValue;
                              valueAsInt = (value * 10).ceil();
                              widget.onFinalChanged(valueAsInt);
                            });
                          })
                    ],
                  ),
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
