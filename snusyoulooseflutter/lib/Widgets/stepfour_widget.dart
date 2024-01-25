import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Config/app_strings.dart';
import 'package:snusyoulooseflutter/Styles/app_colors.dart';

enum AppMode { appMode, dateMode, reduceMode, NONE }

class StepFourWidget extends StatefulWidget {
  final ValueChanged<AppMode> onModeChanged;

  StepFourWidget({required this.onModeChanged});

  @override
  State<StepFourWidget> createState() => _StepFourWidgetState();
}

class _StepFourWidgetState extends State<StepFourWidget> {
  List<bool> isSelected = [false, false];
  AppMode? _selectedMode;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 300,
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0, left: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color:
                    _selectedMode == AppMode.appMode ? Colors.blue[200] : null,
                child: RadioListTile<AppMode>(
                  title: Text(AppStrings.appMode,
                      style: _selectedMode == AppMode.appMode
                          ? TextStyle(color: AppColors.textPrimary)
                          : TextStyle(color: Colors.white)),
                  subtitle: Text(
                    AppStrings.explainAppMode,
                    style: _selectedMode == AppMode.appMode
                        ? TextStyle(color: AppColors.textPrimary)
                        : TextStyle(color: Colors.white),
                  ),
                  value: AppMode.appMode,
                  groupValue: _selectedMode,
                  onChanged: (AppMode? value) {
                    setState(() {
                      _selectedMode = value;
                      widget.onModeChanged(value!);
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Container(
                  color: _selectedMode == AppMode.dateMode
                      ? Colors.blue[200]
                      : null,
                  child: RadioListTile<AppMode>(
                    title: Text(AppStrings.dateMode,
                        style: _selectedMode == AppMode.dateMode
                            ? TextStyle(color: AppColors.textPrimary)
                            : TextStyle(color: Colors.white)),
                    subtitle: Text(
                      AppStrings.explainDateMode,
                      style: _selectedMode == AppMode.dateMode
                          ? TextStyle(color: AppColors.textPrimary)
                          : TextStyle(color: Colors.white),
                    ),
                    value: AppMode.dateMode,
                    groupValue: _selectedMode,
                    onChanged: (AppMode? value) {
                      setState(() {
                        _selectedMode = value;
                        widget.onModeChanged(value!);
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
