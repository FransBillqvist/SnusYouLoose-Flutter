import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Components/app_iconbutton.dart';
import 'package:snusyoulooseflutter/Config/app_media.dart';
import 'package:snusyoulooseflutter/Config/app_strings.dart';
import 'package:snusyoulooseflutter/Styles/app_colors.dart';
import 'package:snusyoulooseflutter/Widgets/stepone_widget.dart';

import '../Widgets/steptwo_widget.dart';

class HabitPage extends StatefulWidget {
  @override
  State<HabitPage> createState() => _HabitPageState();
}

class _HabitPageState extends State<HabitPage> {
  int habitStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getBackgroundColor(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 32),
                  child: SizedBox(
                    width: 250,
                    height: 226,
                    child: Column(
                      children: [
                        Image.asset(
                          AppImages.logoWithoutBg,
                          fit: BoxFit.contain,
                          height: 120,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            AppStrings.habitInfo,
                            style: TextStyle(
                                fontSize: 15, color: AppColors.textOnFocus),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                width: 400,
                height: 400,
                child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 112, 112, 112),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        if (habitStep == 0)
                          StepOneWidget(
                            onDone: () {
                              setState(() {
                                habitStep = 1;
                              });
                            },
                          ),
                        if (habitStep == 1)
                          StepTwoWidget(
                            onDone: () {
                              setState(() {
                                habitStep = 2;
                              });
                            },
                          ),
                      ],
                    )),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Color getBackgroundColor() {
    switch (habitStep) {
      case 0:
        return Colors.red; // Replace with your actual color
      case 1:
        return Colors.green; // Replace with your actual color
      // Add more cases as needed
      default:
        return Colors.white; // Default color
    }
  }
}
