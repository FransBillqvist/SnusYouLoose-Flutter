import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Styles/app_colors.dart';

import '../Config/app_strings.dart';

class UseSnuffWidget extends StatelessWidget {
  late String currentsnuffID;
  UseSnuffWidget({required this.currentsnuffID});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => _showDialog(context));
    return Container(child: Text("test"));
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        int selectedNumber = 1;
        return AlertDialog(
          title: const Text(AppStrings.takenSnuffAmount),
          backgroundColor: AppColors.example2,
          contentPadding: const EdgeInsets.all(18.0),
          content: DropdownButton<int>(
            value: selectedNumber,
            onChanged: (int? newValue) {
              selectedNumber = newValue!;
              Navigator.of(context);
            },
            items: <int>[1, 2, 3, 4, 5].map<DropdownMenuItem<int>>((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(value.toString()),
                ),
                onTap: () {},
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
