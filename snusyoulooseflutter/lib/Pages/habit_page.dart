import 'dart:developer';

import 'package:flutter/material.dart';

import '../Config/app_media.dart';
import '../Config/app_strings.dart';
import '../Styles/app_colors.dart';
import '../Widgets/stepone_widget.dart';
import '../Widgets/stepthree_widget.dart';
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
  late DateTime _selectedMorningDate = DateTime.now();
  late DateTime _selectedEveningDate = DateTime.now();

  void _handleDateChanged(DateTime date) {
    setState(() {
      if (habitStep == 0) {
        _selectedMorningDate = date;
      }
      if (habitStep == 1) {
        _selectedEveningDate = date;
      }
    });
  }

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
                Padding(
                  padding: const EdgeInsets.only(top: 68.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.46,
                        width: MediaQuery.of(context).size.width * 0.96,
                        child: ListView(
                          children: [
                            if (habitStep <= 1)
                              DecoratedBox(
                                decoration: const BoxDecoration(
                                  color: AppColors.example2,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: getDateStepWidget(
                                    habitStep, _handleDateChanged),
                              ),
                            if (habitStep >= 2)
                              DecoratedBox(
                                decoration: const BoxDecoration(
                                  color: AppColors.example2,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: getOtherStepWidget(habitStep),
                              ),
                          ],
                        ),
                      ),
                      if (habitStep == 0)
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              habitStep++;
                              _handleDateChanged(_selectedMorningDate);
                              inspect(_selectedMorningDate);
                            });
                          },
                          child: Icon(Icons.arrow_forward, size: 20),
                        ),
                      if (habitStep == 1)
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _handleDateChanged(_selectedEveningDate);
                              habitStep++;
                              inspect(_selectedEveningDate);
                            });
                          },
                          child: Icon(Icons.arrow_forward, size: 20),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String getQuestString(int habitStep) {
  switch (habitStep) {
    case 0:
      return AppStrings.quest0;
    case 1:
      return AppStrings.quest1;
    case 2:
      return AppStrings.quest2;
    // case 3:
    //   return AppStrings.quest3;
    // case 4:
    //   return AppStrings.quest4;
    default:
      return '';
  }
}

Widget getDateStepWidget(int habitStep, ValueChanged<DateTime> onDateChanged) {
  switch (habitStep) {
    case 0:
      return StepOneWidget(onMorningDateChanged: onDateChanged);
    case 1:
      return StepTwoWidget(onDateChanged: onDateChanged);
    default:
      return Text('');
  }
}

Widget getOtherStepWidget(int habitStep) {
  switch (habitStep) {
    case 2:
      return const StepThreeWidget();
    case 3:
      return Container();
    default:
      return Container();
  }
}

Widget getNextButton(int habitStep) {
  switch (habitStep) {
    case 0:
      return Container();
    case 1:
      return Container();
    default:
      return Container();
  }
}

// Widget getNextButton(int habitStep) {
//   switch (habitStep) {
//     case 0:
//       return ElevatedButton(
//         onPressed: () {
//           setState(() {
//             habitStep++;
//             _handleDateChanged(_selectedMorningDate);
//             inspect(_selectedMorningDate);
//           });
//         },
//         child: Icon(Icons.arrow_forward, size: 20),
//         );
//     case 1:
//       return ElevatedButton(
//               onPressed: () {
//                   setState(() {
//                     _handleDateChanged(_selectedEveningDate);
//                     habitStep++;
//                     inspect(_selectedEveningDate);
//                   });
//                  },
//                  child: Icon(Icons.arrow_forward, size: 20),
//                 )
//     default:
//       return Container();
//   }
// }


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

              // if (habitStep == 1)
                          //   DecoratedBox(
                          //     decoration: const BoxDecoration(
                          //       color: AppColors.example2,
                          //       borderRadius: BorderRadius.all(
                          //         Radius.circular(20),
                          //       ),
                          //     ),
                          //     child: StepTwoWidget(
                          //         onDateChanged: _handleDateChanged),
                          //   ),