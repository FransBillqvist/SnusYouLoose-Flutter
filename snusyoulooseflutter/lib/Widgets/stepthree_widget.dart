import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';

import '../Config/app_strings.dart';

class StepThreeWidget extends StatefulWidget {
  const StepThreeWidget({super.key});

  @override
  State<StepThreeWidget> createState() => _StepThreeWidgetState();
}

class _StepThreeWidgetState extends State<StepThreeWidget> {
  String value = 'flutter';
  List<S2Choice<String>> options = [
    S2Choice<String>(value: 'prillor', title: AppStrings.portions),
    S2Choice<String>(value: 'dosor', title: AppStrings.snuffBox),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          SmartSelect<String>.single(
              title: AppStrings.portionType,
              selectedValue: value,
              choiceItems: options,
              onChange: (state) => setState(() => value = state.value)),
        ],
      ),
    );
  }
}
