import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Components/app_iconbutton.dart';
import 'package:snusyoulooseflutter/Config/app_media.dart';
import 'package:snusyoulooseflutter/Config/app_strings.dart';
import 'package:snusyoulooseflutter/Styles/app_colors.dart';

class HabitPage extends StatefulWidget {
  const HabitPage({super.key});

  @override
  State<HabitPage> createState() => _HabitPageState();
}

class _HabitPageState extends State<HabitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      color: AppColors.example2,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              print('YOU PRESSED: APP');
                            },
                            child: Text(
                              AppStrings.appMode,
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.textOnFocus,
                              ),
                            ),
                          ),
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
}
