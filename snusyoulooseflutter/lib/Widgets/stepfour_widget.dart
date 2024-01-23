import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Config/app_strings.dart';
import 'package:snusyoulooseflutter/Styles/app_colors.dart';

enum AppMode { appMode, dateMode, NONE }

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

              // ElevatedButton(
              //     onPressed: () {},
              //     child: const Column(
              //       children: [
              //         Text(
              //           AppStrings.appMode,
              //           style: TextStyle(fontSize: 20),
              //         ),
              //         Padding(
              //           padding: EdgeInsets.only(top: 4, bottom: 4),
              //           child: Text(
              //             AppStrings.explainAppMode,
              //             textAlign: TextAlign.center,
              //           ),
              //         ),
              //       ],
              //     )),
              // Padding(
              //   padding: const EdgeInsets.only(top: 18.0),
              //   child: ElevatedButton(
              //       onPressed: () {},
              //       child: const Column(
              //         children: [
              //           Text(
              //             AppStrings.dateMode,
              //             style: TextStyle(fontSize: 20),
              //           ),
              //           Padding(
              //             padding: EdgeInsets.only(top: 4, bottom: 4),
              //             child: Text(
              //               AppStrings.explainDateMode,
              //               textAlign: TextAlign.center,
              //             ),
              //           ),
              //         ],
              //       )),
              // ),


            //   ToggleButtons(
            //   isSelected: isSelected,
            //   children: <Widget>[
            //     ListTile(
            //       title: Text(AppStrings.appMode),
            //       subtitle: Text(AppStrings.explainAppMode),
            //       trailing: Radio(
            //         value: AppMode.appMode,
            //         groupValue: _selectedMode,
            //         onChanged: (AppMode? value) {
            //           setState(() {
            //             _selectedMode = value;
            //           });
            //         },
            //       ),
            //     ),
            //     ListTile(
            //       title: Text(AppStrings.dateMode),
            //       subtitle: Text(AppStrings.explainDateMode),
            //       trailing: Radio(
            //         value: AppMode.dateMode,
            //         groupValue: _selectedMode,
            //         onChanged: (AppMode? value) {
            //           setState(() {
            //             _selectedMode = value;
            //           });
            //         },
            //       ),
            //     ),
            //   ],
            // )