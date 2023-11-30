import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Styles/app_colors.dart';

import '../Model/Snuff.dart';

class SnuffWidget extends StatelessWidget {
  final Snuff snuff;
  final Function onChanged;
  const SnuffWidget(
      {required Key key, required this.snuff, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: snuff.selected,
          onChanged: (onChange) {
            onChanged(onChange);
          },
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              snuff.Type,
              style: TextStyle(color: AppColors.textPrimary),
            ),
            Text(
              snuff.Type,
              style: TextStyle(color: AppColors.textPrimary),
            ),
          ],
        ),
      ],
    );
  }
}
