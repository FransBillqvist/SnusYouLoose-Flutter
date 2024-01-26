import 'package:flutter/material.dart';

class UseSnuffWidget extends StatelessWidget {
  late String currentsnuffID;
  UseSnuffWidget({required this.currentsnuffID});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => _showDialog(context));
    return const Placeholder();
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        int selectedNumber = 1;
        return AlertDialog(
          title: Text('Select a number'),
          content: DropdownButton<int>(
            value: selectedNumber,
            onChanged: (int? newValue) {
              selectedNumber = newValue!;
              Navigator.of(context).pop();
            },
            items: <int>[1, 2, 3, 4, 5].map<DropdownMenuItem<int>>((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(value.toString()),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
