import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:snusyoulooseflutter/Widgets/stepfour_widget.dart';

import '../Config/app_strings.dart';

class StepSixWidget extends StatefulWidget {
  late DateTime wakeUpTime = DateTime(0);
  late DateTime sleepTime = DateTime(0);
  late AppMode modeType;
  late int? speed;
  late int amountOfSnuff;
  late String doseType;
  final DateTime startDate = DateTime.now();
  final DateTime? EndDate;
  StepSixWidget(
      {required this.wakeUpTime,
      required this.sleepTime,
      required this.modeType,
      required this.amountOfSnuff,
      required this.doseType,
      this.speed,
      this.EndDate});

  @override
  State<StepSixWidget> createState() => _StepSixWidgetState();
}

String getDose(String doseType) {
  switch (doseType) {
    case 'prillor':
      return 'Portions';
    case 'dosor':
      return 'Boxes';
    case _:
      return 'Snuff';
  }
}

String getMode(AppMode modeType) {
  switch (modeType) {
    case AppMode.appMode:
      return 'App';
    case AppMode.dateMode:
      return 'Date';
    case AppMode.reduceMode:
      return 'Reduce';
    case AppMode.NONE:
      return 'NONE';
    default:
      return 'none';
  }
}

class _StepSixWidgetState extends State<StepSixWidget> {
  final double textSize = 18;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Column(
        children: [
          const Padding(
            padding: const EdgeInsets.only(top: 36.0, bottom: 6.0),
            child: Text(
              AppStrings.recapHabit,
              style: TextStyle(fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 40),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(AppStrings.wakeUpTime,
                        style: TextStyle(fontSize: 16)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(AppStrings.sleepTime,
                        style: TextStyle(fontSize: 16)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(AppStrings.doseType,
                        style: TextStyle(fontSize: 16)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(AppStrings.amountOf,
                        style: TextStyle(fontSize: 16)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(AppStrings.modeSelected,
                        style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(DateFormat('HH:mm').format(widget.wakeUpTime),
                        style: TextStyle(fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(DateFormat('HH:mm').format(widget.sleepTime),
                        style: TextStyle(fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(getDose(widget.doseType),
                        style: TextStyle(fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(widget.amountOfSnuff.toString(),
                        style: TextStyle(fontSize: 18)),
                  ),
                  Text(getMode(widget.modeType),
                      style: TextStyle(fontSize: 18)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
