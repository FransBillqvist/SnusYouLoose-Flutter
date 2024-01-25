import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:snusyoulooseflutter/Model/HabitDto.dart';
import 'package:snusyoulooseflutter/Model/HabitRequest.dart';
import 'package:snusyoulooseflutter/Redux/app_state.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import '../Config/app_media.dart';
import '../Config/app_routes.dart';
import '../Config/app_strings.dart';
import '../Redux/app_thunks.dart';
import '../Styles/app_colors.dart';
import '../Widgets/stepfive_widget.dart';
import '../Widgets/stepfour_widget.dart';
import '../Widgets/stepone_widget.dart';
import '../Widgets/stepsix_widget.dart';
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
  late DateTime _selectedMorningDate = DateTime(0);
  late DateTime _selectedEveningDate = DateTime(0);
  var selectedAmount = 0;
  var selectedPortionType = '';
  var selectedMode = AppMode.NONE;
  var selectedEndDate = DateTime(0);
  var selectedReduceSpeed = 0;
  double _sliderValue = 0;
  bool isFinished = false;

  void _finalishHabit() {
    final store = StoreProvider.of<AppState>(context);
    final userid = store.state.user?.UserId.toString();
    inspect(userid);
    var a = HabitDto(
        selectedPortionType,
        selectedAmount,
        _handleProgressionType(selectedMode),
        selectedReduceSpeed.toString(),
        _calculateNumberOfHoursPerDay(
            _selectedMorningDate, _selectedEveningDate),
        DateTime.now(),
        DateTime.now());
    var b = HabitRequest(userid!, a);
    inspect(b);
    store.dispatch(createHabit(a, userid, context));
  }

  String _handleProgressionType(AppMode mode) {
    switch (mode) {
      case AppMode.appMode:
        return 'app';
      case AppMode.dateMode:
        return 'date';
      case AppMode.reduceMode:
        return 'reduce';
      default:
        return 'none';
    }
  }

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

  void _handleAmountChanged(int amount) {
    setState(() {
      selectedAmount = amount;
    });
  }

  void _handlePortionTypeChanged(String portionType) {
    setState(() {
      selectedPortionType = portionType;
    });
  }

  void _handleModeChanged(AppMode mode) {
    setState(() {
      selectedMode = mode;
    });
  }

  void _handleFinalChanged(dynamic finalValue) {
    setState(() {
      if (finalValue is DateTime) {
        selectedEndDate = finalValue;
      }
      if (finalValue is int) {
        selectedReduceSpeed = finalValue;
      }
    });
  }

  int _calculateNumberOfHoursPerDay(DateTime wakeUpTime, DateTime sleepTime) {
    var numberOfHoursPerDay = 0;
    if (wakeUpTime.hour > sleepTime.hour) {
      numberOfHoursPerDay = (24 - wakeUpTime.hour) + sleepTime.hour;
    } else {
      numberOfHoursPerDay = sleepTime.hour - wakeUpTime.hour;
    }
    return numberOfHoursPerDay.ceil();
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
      body: Stack(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 32),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 166, //gör större mellan text och MainContainer
                    child: Row(
                      children: [
                        if (habitStep > 0)
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.transparent,
                                ),
                                elevation: MaterialStateProperty.all(0),
                              ),
                              onPressed: () {
                                setState(() {
                                  if (habitStep == 5) {
                                    habitStep = 3;
                                  }
                                  habitStep--;
                                });
                              },
                              child: Icon(
                                (habitStep == 0
                                    ? Icons.block
                                    : Icons.arrow_back),
                                size: 28,
                                color: Colors.indigoAccent[200],
                              ),
                            ),
                          ),
                        if (habitStep <= 0)
                          Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width *
                                      0.29)),
                        if (habitStep >= 1)
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.11),
                          ),
                        Image.asset(
                          AppImages.logoWithoutBg,
                          fit: BoxFit.contain,
                          height: 120,
                        ),
                      ], //rad 124
                    ),
                  ),
                ),
              ], //rad 117
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                getQuestString(habitStep), //här är frågan
                style: TextStyle(fontSize: 17, color: AppColors.textOnFocus),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 68.0),
              child: Column(children: [
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
                          child:
                              getDateStepWidget(habitStep, _handleDateChanged),
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
                if (habitStep == 2 && selectedAmount != 0)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _handleAmountChanged(selectedAmount);
                        _handlePortionTypeChanged(selectedPortionType);
                        habitStep++;
                        inspect(selectedAmount);
                        inspect(selectedPortionType);
                      });
                    },
                    child: Icon(Icons.arrow_forward, size: 20),
                  ),
                if (habitStep == 3 && selectedMode != AppMode.NONE)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _handleModeChanged(selectedMode);
                        if (selectedMode == AppMode.appMode) habitStep++;
                        if (selectedMode == AppMode.dateMode) habitStep = 5;
                        inspect(selectedMode);
                      });
                    },
                    child: Icon(Icons.arrow_forward, size: 20),
                  ),
                if (habitStep == 4 && selectedReduceSpeed != 0)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _handleFinalChanged(selectedReduceSpeed);
                        habitStep = 6;
                        inspect(selectedReduceSpeed);
                      });
                    },
                    child: Icon(Icons.arrow_forward, size: 20),
                  ),
                if (habitStep == 5 && selectedEndDate != DateTime(0))
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _handleFinalChanged(selectedEndDate);
                        habitStep++;
                        inspect(selectedEndDate);
                      });
                    },
                    child: Icon(Icons.arrow_forward, size: 20),
                  ),
                if (habitStep == 6)
                  SizedBox(
                    height: 60,
                    width: 320,
                    child: SwipeableButtonView(
                      buttonText: AppStrings.crtHabit,
                      buttonWidget: Container(
                        child: Icon(Icons.arrow_forward,
                            color: AppColors.example5),
                      ),
                      activeColor: AppColors.example2,
                      isFinished: isFinished,
                      onWaitingProcess: () {
                        Future.delayed(const Duration(milliseconds: 750), () {
                          setState(() {
                            isFinished = true;
                          });
                        });
                      },
                      onFinish: () async {
                        _finalishHabit();
                      },
                    ),
                  )
              ]),
            ),
          ]),
        ),
      ]),
    );
  }

  Widget getOtherStepWidget(int habitStep) {
    switch (habitStep) {
      case 2:
        return StepThreeWidget(
          onStringChanged: _handlePortionTypeChanged,
          onAmountChanged: _handleAmountChanged,
        );
      case 3:
        return StepFourWidget(
          onModeChanged: _handleModeChanged,
        );
      case 4:
        return StepFiveWidget(
            onFinalChanged: _handleFinalChanged, stepIndecator: habitStep);
      case 5:
        return StepFiveWidget(
            onFinalChanged: _handleFinalChanged, stepIndecator: habitStep);
      case 6:
        return StepSixWidget(
          wakeUpTime: _selectedMorningDate,
          sleepTime: _selectedEveningDate,
          modeType: selectedMode,
          amountOfSnuff: selectedAmount,
          doseType: selectedPortionType,
          speed: selectedReduceSpeed,
          EndDate: selectedEndDate,
        );
      default:
        return Container();
    }
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
    case 3:
      return AppStrings.quest3;
    case 4:
      return AppStrings.quest4;
    case 5:
      return AppStrings.quest5;
    case 6:
      return AppStrings.quest6;
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
