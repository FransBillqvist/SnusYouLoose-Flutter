import 'package:flutter/material.dart';

import '../Styles/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final String helperText;
  final TextEditingController controllerName;
  final onChanged;
  const AppTextField(
      {Key? key,
      this.hintText = "",
      this.helperText = "",
      required this.controllerName,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controllerName,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText == "" ? null : hintText,
          labelText: hintText == "" ? null : hintText,
          labelStyle: TextStyle(color: Colors.white),
          helperText: helperText == "" ? null : helperText,
          hintStyle: TextStyle(color: Color.fromARGB(202, 0, 0, 0)),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(18),
          ),
          filled: true,
          fillColor: AppColors.textFieldHintColor,
          focusColor: AppColors.textOnFocus,
        ));
  }
}
