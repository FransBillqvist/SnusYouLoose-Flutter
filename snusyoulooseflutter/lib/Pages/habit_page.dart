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

class _HabitPageState extends State<HabitPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late CurvedAnimation _curve;
  int habitStep = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 32),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height:
                              166, //gör större mellan text och MainContainer
                          child: Row(
                            children: [
                              if (habitStep > 0)
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        habitStep--;
                                      });
                                    },
                                    child: Icon(Icons.arrow_back, size: 20),
                                  ),
                                ),
                              if (habitStep <= 0)
                                Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.27)),
                              if (habitStep >= 1)
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.11),
                                ),
                              Image.asset(
                                AppImages.logoWithoutBg,
                                fit: BoxFit.contain,
                                height: 120,
                              ),
                              if (habitStep < 53)
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      habitStep++;
                                    });
                                  },
                                  child: Icon(Icons.arrow_forward, size: 20),
                                ),
                            ],
                          ),
                          //ny ending
                        ),
                      ),
                    ]),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    getQuestString(habitStep), //här är frågan
                    style:
                        TextStyle(fontSize: 17, color: AppColors.textOnFocus),
                  ),
                ),
                Row(
                  children: [
                    if (habitStep == 0)
                      Padding(
                        padding: const EdgeInsets.only(top: 58.0),
                        child: AnimatedPositioned(
                          duration: _controller.duration!,
                          curve: _curve.curve,
                          right: habitStep >= 1 ? 300 : 100,
                          child: const Icon(Icons.star, size: 40),
                        ),
                      ),
                    if (habitStep == 1)
                      AnimatedPositioned(
                        duration: _controller.duration!,
                        curve: _curve.curve,
                        right: habitStep >= 2 ? 100 : 300,
                        child: const Icon(Icons.star_border, size: 40),
                      ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.46,
                  width: MediaQuery.of(context).size.width * 0.96,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.example2,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    // //tar bort all under
    // // Padding(
    // //                       padding: const EdgeInsets.only(top: 55),
    // //                       child: Text(
    // //                         getQuestString(habitStep),
    // //                         style: TextStyle(
    // //                             fontSize: 15, color: AppColors.textOnFocus),
    // //                       ),
    // //                     ),
    //                     if (habitStep >= 1)
    //                       Padding(padding: EdgeInsets.only(top: 20)),
    //                     ElevatedButton(
    //                       onPressed: () {
    //                         if (habitStep > 0)
    //                           setState(() {
    //                             habitStep--;
    //                           });
    //                       },
    //                       child: Icon(Icons.arrow_back, size: 20),
    //                     ),
    //                     Stack(
    //                       children: [
    //                         if (habitStep == 0)
    //                           AnimatedPositioned(
    //                             duration: const Duration(seconds: 3),
    //                             right: habitStep >= 1 ? 300 : 100,
    //                             child: const Icon(Icons.star, size: 40),
    //                           ),
    //                         if (habitStep == 1)
    //                           AnimatedPositioned(
    //                             duration: const Duration(seconds: 1),
    //                             right: habitStep >= 2 ? 100 : 300,
    //                             child: const Icon(Icons.star_border, size: 40),
    //                           ),
    //                       ],
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             )
    //           ],
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(top: 60),
    //           child: SizedBox(
    //             width: 400,
    //             height: 400,
    //             child: Container(
    //                 decoration: BoxDecoration(
    //                   color: AppColors.example2,
    //                   borderRadius: BorderRadius.all(
    //                     Radius.circular(20),
    //                   ),
    //                 ),
    //                 child: Stack(
    //                   children: [
    //                     if (habitStep == 0) StepOneWidget(),
    //                     if (habitStep == 0)
    //                       ElevatedButton(
    //                         onPressed: () => setState(() {
    //                           startFirstAnimations();
    //                           habitStep = 1;
    //                         }),
    //                         child: Text('Accept Step 1'),
    //                       ),
    //                     if (habitStep == 1) StepOneWidget(),
    //                     if (habitStep == 1)
    //                       ElevatedButton(
    //                         onPressed: () => setState(() {
    //                           startSecoundAnimations();
    //                           habitStep = 2;
    //                         }),
    //                         child: Text('Accept step 2'),
    //                       ),
    //                   ],
    //                 )),
    //           ),
    //         ),
    //       ]),
    //     ),
    //   ]),
    // );
  }
}

String getQuestString(int habitStep) {
  switch (habitStep) {
    case 0:
      return AppStrings.quest0;
    case 1:
      return AppStrings.quest1;
    // case 2:
    //   return AppStrings.quest2;
    // case 3:
    //   return AppStrings.quest3;
    // case 4:
    //   return AppStrings.quest4;
    default:
      return '';
  }
}
