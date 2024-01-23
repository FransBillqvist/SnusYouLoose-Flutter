import 'dart:ffi';

import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Components/app_textfield.dart';
import 'package:snusyoulooseflutter/Styles/app_colors.dart';

import '../Config/app_strings.dart';

class StepThreeWidget extends StatefulWidget {
  final ValueChanged<String> onStringChanged;
  final ValueChanged<int> onAmountChanged;

  StepThreeWidget(
      {required this.onStringChanged, required this.onAmountChanged});

  @override
  State<StepThreeWidget> createState() => _StepThreeWidgetState();
}

class _StepThreeWidgetState extends State<StepThreeWidget> {
  final amountController = TextEditingController();
  late String value = '';
  late int amount = 0;
  List<S2Choice<String>> options = [
    S2Choice<String>(value: 'prillor', title: AppStrings.portions),
    S2Choice<String>(
      value: 'dosor',
      title: AppStrings.snuffBox,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 300,
        width: MediaQuery.of(context).size.width * 0.2,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 32.0, right: 12.0, left: 12.0),
              child: SmartSelect<String>.single(
                title: AppStrings.portionType,
                // Change the title color
                modalTitle: 'Select Portion Type',
                modalHeaderStyle: S2ModalHeaderStyle(
                  backgroundColor: AppColors.example2,
                  centerTitle: true,
                  textStyle: TextStyle(
                      color: AppColors.example4,
                      fontSize: 17), // Change the modal title color
                ),
                choiceTitleBuilder: (BuildContext context,
                    S2SingleState<String> state, S2Choice<String> choice) {
                  return Text(
                    choice.title ?? '',
                    style: TextStyle(
                        color: AppColors.example3,
                        fontSize: 17), // Change the choice title color
                  );
                },
                selectedValue: value,
                choiceItems: options,
                modalType: S2ModalType.bottomSheet,
                onChange: (state) {
                  setState(() {
                    value = state.value;
                    widget.onStringChanged(value);
                  });
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 18.0, right: 12.0, left: 12.0),
              child: AppTextField(
                  controllerName: amountController,
                  labelText: value == 'prillor'
                      ? AppStrings.selectAmount + AppStrings.portions
                      : AppStrings.selectAmount + AppStrings.portions,
                  keyboardType: 'number',
                  textAlignment: 'center',
                  onChanged: (value) {
                    amount = int.parse(value);
                    widget.onAmountChanged(amount);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
