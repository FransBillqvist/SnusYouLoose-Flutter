import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Styles/app_colors.dart';

class AppIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String icon;
  final int currentPage; //Change to DestionationPage
  final int destinationPage; //Change to DestionationPage

  const AppIconButton(
      {Key? key,
      required this.onPressed,
      required this.icon,
      this.currentPage = 0,
      this.destinationPage = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
            currentPage == destinationPage
                ? AppColors.example2
                : AppColors.example1,
            BlendMode.srcIn),
      ),
    );
  }
}
