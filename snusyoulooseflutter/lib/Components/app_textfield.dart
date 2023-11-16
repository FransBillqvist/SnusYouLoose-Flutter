import 'package:flutter/material.dart';

import '../Styles/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final String helperText;
  final String textAlignment;
  final String keyboardType;
  final bool? obscureText;
  final TextEditingController controllerName;
  final onChanged;
  const AppTextField(
      {Key? key,
      this.hintText = "",
      this.helperText = "",
      required this.controllerName,
      this.onChanged,
      required this.labelText,
      this.textAlignment = "",
      this.keyboardType = "",
      this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllerName,
      onChanged: onChanged,
      textAlign: textAlignment == ""
          ? TextAlign.start
          : textAlignment == "center"
              ? TextAlign.center
              : textAlignment == "left"
                  ? TextAlign.left
                  : textAlignment == "right"
                      ? TextAlign.right
                      : TextAlign.start,
      keyboardType: keyboardType == ""
          ? TextInputType.text
          : keyboardType == "email"
              ? TextInputType.emailAddress
              : keyboardType == "number"
                  ? TextInputType.number
                  : keyboardType == "phone"
                      ? TextInputType.phone
                      : TextInputType.text,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hintText == "" ? null : hintText,
        labelText: labelText,
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
      ),
    );
  }
}
