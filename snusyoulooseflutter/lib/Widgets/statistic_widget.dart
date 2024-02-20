import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Model/StatisticDto.dart';
import 'package:snusyoulooseflutter/Styles/app_colors.dart';

import '../Config/app_strings.dart';
import '../Services/app_services.dart';

class StatisticWidget extends StatefulWidget {
  late int mode;
  StatisticWidget({required this.mode});

  @override
  State<StatisticWidget> createState() => _StatisticWidgetState();
}

class _StatisticWidgetState extends State<StatisticWidget> {
  late DateTime yesterday;
  late DateTime lastWeek;
  late DateTime twoWeeksAgo;
  late DateTime lastMonth;
  late DateTime lastQuarter;
  late DateTime lastYear;

  @override
  void initState() {
    super.initState();
    var tempYesterday = DateTime.now().subtract(Duration(days: 1)).toLocal();
    yesterday = DateTime(
        tempYesterday.year, tempYesterday.month, tempYesterday.day, 23, 59, 59);
    var templastWeek = DateTime.now().subtract(Duration(days: 8));
    lastWeek = DateTime(
        templastWeek.year, templastWeek.month, templastWeek.day, 0, 0, 0);
    var temptwoWeeksAgo = DateTime.now().subtract(Duration(days: 15));
    twoWeeksAgo = DateTime(temptwoWeeksAgo.year, temptwoWeeksAgo.month,
        temptwoWeeksAgo.day, 0, 0, 0);
    var templastMonth = DateTime.now().subtract(Duration(days: 31));
    lastMonth = DateTime(
        templastMonth.year, templastMonth.month, templastMonth.day, 0, 0, 0);
    var templastQuarter = DateTime.now().subtract(Duration(days: 91));
    lastQuarter = DateTime(templastQuarter.year, templastQuarter.month,
        templastQuarter.day, 0, 0, 0);
    var templastYear = DateTime.now().subtract(Duration(days: 366));
    lastYear = DateTime(
        templastYear.year, templastYear.month, templastYear.day, 0, 0, 0);
  }

  @override
  Widget build(BuildContext context) {
    var userId = getUserIdService(context);
    var titles = [
      AppStrings.stat4Today,
      AppStrings.stat4Week,
      AppStrings.stat4Two,
      AppStrings.stat4Month,
      AppStrings.stat4Quarter,
      AppStrings.stat4Year,
      AppStrings.stat4LT
    ];
    var dataDays = [
      7,
      14,
      30,
      90,
      365,
    ];
    var baseStyle = TextStyle(
        color: AppColors.textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold);
    var propStyle = TextStyle(
        color: AppColors.textPrimary2,
        fontSize: 20,
        fontWeight: FontWeight.normal);

    return FutureBuilder<StatisticDto>(
      future: fetchData(widget.mode, userId),
      builder: (BuildContext context, AsyncSnapshot<StatisticDto> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          var stats = snapshot.data;
          // Använd `snapshot.data` för att bygga din widget baserat på den hämtade statistiken
          return Stack(
            children: [
              Positioned(
                top: 25,
                left: 15,
                child: Column(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                          color: AppColors.example3,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColors.example3.withOpacity(0.5)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ]),
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.78,
                          width: MediaQuery.of(context).size.width * 0.94,
                          child: Column(
                            children: [
                              Text(
                                titles[widget.mode],
                                style: baseStyle,
                              ),
                              Text(
                                '${stats!.rating.toString()}',
                                style: baseStyle,
                              ),
                              Text(
                                  '${stats.totalAmoutUsed.toString()} / ${stats.limitOfUse.toString()}',
                                  style: baseStyle),
                              Text('', style: baseStyle),
                            ],
                          )),
                    )
                  ],
                ),
              )
            ],
          );
        }
      },
    );
  }

  Future<StatisticDto> fetchData(int mode, String userId) async {
    switch (mode) {
      case 0:
        return await fetchDailyStatisticService(userId);
      case 1:
        return await fetchStatisticsForPeriodService(
            userId, lastWeek, yesterday);
      case 2:
        return await fetchStatisticsForPeriodService(
            userId, twoWeeksAgo, yesterday);
      case 3:
        return await fetchStatisticsForPeriodService(
            userId, lastMonth, yesterday);
      case 4:
        return await fetchStatisticsForPeriodService(
            userId, lastQuarter, yesterday);
      case 5:
        return await fetchStatisticsForPeriodService(
            userId, lastYear, yesterday);
      case 6:
        return await fetchLifeTimeStatisticService(userId);
      default:
        throw Exception('Invalid mode: $mode');
    }
  }
}
