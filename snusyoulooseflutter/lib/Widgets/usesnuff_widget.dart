import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Config/app_routes.dart';
import 'package:snusyoulooseflutter/Pages/home_page.dart';
import 'package:snusyoulooseflutter/Services/app_services.dart';
import 'package:snusyoulooseflutter/Styles/app_colors.dart';

import '../Config/app_strings.dart';

class UseSnuffWidget extends StatefulWidget {
  final String currentsnuffID;

  UseSnuffWidget({required this.currentsnuffID});

  @override
  _UseSnuffWidgetState createState() => _UseSnuffWidgetState();
}

class _UseSnuffWidgetState extends State<UseSnuffWidget> {
  late int selectedNumber;
  bool isDialogShowing = false;

  @override
  Widget build(BuildContext context) {
    if (!isDialogShowing) {
      Future.delayed(Duration(milliseconds: 300), () => _showDialog(context));
    }
    return HomePage();
  }

  void _showDialog(BuildContext contextd) {
    int selectedValue = 1;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(AppStrings.takenSnuffAmount),
          backgroundColor: AppColors.example2,
          contentPadding: const EdgeInsets.all(18.0),
          content: NumberDropdown(
            currentsnuffID: widget.currentsnuffID,
            onValueChanged: (newValue) {
              selectedValue = newValue;

              // inspect(onAmountChanged);
            },
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 118.0),
              child: TextButton(
                child: const Text(
                  AppStrings.close,
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            TextButton(
              child: const Text(
                AppStrings.ok,
                style: TextStyle(fontSize: 18, color: AppColors.primary),
              ),
              onPressed: () async {
                postSnuffTakenService(widget.currentsnuffID, selectedValue);
                Navigator.of(context).restorablePopAndPushNamed(AppRoutes.home);
              },
            ),
          ],
        );
      },
    ).then((_) => isDialogShowing = false);
  }
}

class NumberDropdown extends StatefulWidget {
  final String currentsnuffID;
  final ValueChanged<int> onValueChanged;

  NumberDropdown({required this.currentsnuffID, required this.onValueChanged});

  @override
  _NumberDropdownState createState() => _NumberDropdownState();
}

class _NumberDropdownState extends State<NumberDropdown> {
  int selectedNumber = 1;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: selectedNumber,
      onChanged: (newValue) {
        setState(() {
          selectedNumber = newValue!;
          widget.onValueChanged(
              newValue); // Call callback function to pass the selected value
        });
      },
      items: <int>[1, 2, 3, 4, 5].map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(value.toString()),
          ),
        );
      }).toList(),
    );
  }
}



// class UseSnuffWidget extends StatefulWidget {
//   final String currentsnuffID;

//   UseSnuffWidget({required this.currentsnuffID});

//   @override
//   _UseSnuffWidgetState createState() => _UseSnuffWidgetState();
// }

// class _UseSnuffWidgetState extends State<UseSnuffWidget> {
//   int selectedNumber = 1;

//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(Duration.zero, () => _showDialog(context));
//     return HomePage();
//   }

//   void _showDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text(AppStrings.takenSnuffAmount),
//           backgroundColor: AppColors.example2,
//           contentPadding: const EdgeInsets.all(18.0),
//           content: DropdownButton<int>(
//             value: selectedNumber,
//             onChanged: (int? newValue) {
//               setState(() {
//                 selectedNumber = newValue!;
//               });
//             },
//             items: <int>[1, 2, 3, 4, 5].map<DropdownMenuItem<int>>((int value) {
//               return DropdownMenuItem<int>(
//                 value: value,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 18.0),
//                   child: Text(value.toString()),
//                 ),
//               );
//             }).toList(),
//           ),
//         );
//       },
//     );
//   }
// }



// class UseSnuffWidget extends StatelessWidget {
//   late String currentsnuffID;
//   UseSnuffWidget({required this.currentsnuffID});

//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(Duration.zero, () => _showDialog(context));
//     return HomePage();
//   }

//   void _showDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         int selectedNumber = 1;
//         return AlertDialog(
//           title: const Text(AppStrings.takenSnuffAmount),
//           backgroundColor: AppColors.example2,
//           contentPadding: const EdgeInsets.all(18.0),
//           content: DropdownButton<int>(
//             value: selectedNumber,
//             onChanged: (int? newValue) {
//               selectedNumber = newValue!;
//             },
//             items: <int>[1, 2, 3, 4, 5].map<DropdownMenuItem<int>>((int value) {
//               return DropdownMenuItem<int>(
//                 value: value,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 18.0),
//                   child: Text(value.toString()),
//                 ),
//               );
//             }).toList(),
//           ),
//         );
//       },
//     );
//   }
// }
