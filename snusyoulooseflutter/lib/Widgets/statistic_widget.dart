import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Model/StatisticDto.dart';
import 'package:snusyoulooseflutter/Styles/app_colors.dart';

import '../Config/app_media.dart';
import '../Config/app_strings.dart';
import '../Model/Snuff.dart';
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
    var dataDays = [0, 7, 14, 30, 90, 365, 365];
    const baseStyle = TextStyle(
        color: AppColors.textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold);
    const propStyle = TextStyle(
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

          if (stats == null) {
            return const Text('No data');
          }
          List<Snuff> snuffs = stats.usedSnuffSorts;
          List<int> ints = stats.usedAmountOfSnuffs;

          // Convert the list to a map with indices as keys
          Map<int, int> indexedInts = ints.asMap();

          // Convert the map to a list of entries and sort it in descending order based on the values
          List<MapEntry<int, int>> sortedEntries = indexedInts.entries.toList()
            ..sort((a, b) => b.value.compareTo(a.value));

          // Take the first three entries and map them to their keys (which are the original indices)
          List<int> topThreeIndices =
              sortedEntries.take(3).map((entry) => entry.key).toList();
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
                              '${stats.rating.toString()}',
                              style: baseStyle,
                            ),
                            Text(
                                '${stats.totalAmoutUsed.toString()} / ${stats.limitOfUse.toString()}',
                                style: baseStyle),
                            SizedBox(
                              height: 66,
                            ),
                            Row(children: [
                              Padding(padding: EdgeInsets.only(left: 66)),
                              if (snuffs.isNotEmpty) ...[
                                if (snuffs[topThreeIndices[1]] != 0) ...[
                                  Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 40.0),
                                      child: Image.asset(
                                          AppSnuffs.images[
                                                  snuffs[topThreeIndices[1]]
                                                      .ImageUrl] ??
                                              '',
                                          width: 80,
                                          height: 80),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top:
                                              10), // Push the box down by the height of the "roof"
                                      child: DecoratedBox(
                                        decoration: const BoxDecoration(
                                          color: AppColors.silverPlace,
                                          border: Border.fromBorderSide(
                                              BorderSide(
                                                  color: AppColors.silverPlace,
                                                  width: 2.0)),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(0),
                                              topRight: Radius.circular(0)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: AppColors.silverPlace,
                                                spreadRadius: 0,
                                                blurRadius: 0,
                                                offset: Offset(0, 3))
                                          ],
                                        ),
                                        child: Container(
                                          width: 82,
                                          height: 100,
                                          child: Column(children: [
                                            SizedBox(height: 12),
                                            const Text('#2',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color:
                                                      AppColors.silverStamped,
                                                  shadows: [
                                                    Shadow(
                                                      offset: Offset(1.0, 1.0),
                                                      blurRadius: 2.0,
                                                    )
                                                  ],
                                                  decoration:
                                                      TextDecoration.underline,
                                                )),
                                            SizedBox(
                                                height:
                                                    28), // Push the text down by the height of the "roof" (8 pixels in this case
                                            Text(
                                              ints[topThreeIndices[1]]
                                                  .toString(),
                                              style: baseStyle,
                                            ),
                                          ]),
                                        ),
                                      ),
                                    )
                                  ])
                                ],
                                Row(
                                  children: [
                                    if (snuffs.isEmpty) ...[
                                      Text('No snuff used', style: baseStyle)
                                    ],
                                  ],
                                ),
                                if (snuffs.isNotEmpty) ...[
                                  Column(children: [
                                    Image.asset(
                                        AppSnuffs.images[
                                                snuffs[topThreeIndices[0]]
                                                    .ImageUrl] ??
                                            '',
                                        width: 80,
                                        height: 80),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: DecoratedBox(
                                        decoration: const BoxDecoration(
                                          color: AppColors.goldPlace,
                                          border: Border.fromBorderSide(
                                              BorderSide(
                                                  color: AppColors.goldPlace,
                                                  width: 2.0)),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(0),
                                              topRight: Radius.circular(0)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: AppColors.goldPlace,
                                                spreadRadius: 0,
                                                blurRadius: 0,
                                                offset: Offset(0, 3))
                                          ],
                                        ),
                                        child: Container(
                                          width: 82,
                                          height: 140,
                                          child: Column(children: [
                                            SizedBox(
                                                height:
                                                    12), // Push the text down by the height of the "roof" (8 pixels in this case
                                            const Text('#1',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: AppColors.goldStamped,
                                                  shadows: [
                                                    Shadow(
                                                      offset: Offset(1.0,
                                                          1.0), // Lätt förskjuten skugga ger djup
                                                      blurRadius:
                                                          2.0, // En liten suddighet för realism
                                                      // Halvtransparent svart för mjuk skugga
                                                    ),
                                                  ],
                                                  decoration:
                                                      TextDecoration.underline,
                                                )),
                                            SizedBox(
                                                height:
                                                    28), // Push the text down by the height of the "roof" (8 pixels in this case
                                            Text(
                                              ints[topThreeIndices[0]]
                                                  .toString(),
                                              style: baseStyle,
                                            ),
                                          ]),
                                        ),
                                      ),
                                    )
                                  ]),
                                ],
                                if (snuffs[topThreeIndices[2]] != 0) ...[
                                  Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 80.0),
                                      child: Image.asset(
                                          AppSnuffs.images[
                                                  snuffs[topThreeIndices[2]]
                                                      .ImageUrl] ??
                                              '',
                                          width: 80,
                                          height: 80),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: DecoratedBox(
                                        decoration: const BoxDecoration(
                                          color: AppColors.bronzePlace,
                                          border: Border.fromBorderSide(
                                              BorderSide(
                                                  color: AppColors.bronzePlace,
                                                  width: 2.0)),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(0),
                                              topRight: Radius.circular(0)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: AppColors.bronzePlace,
                                                spreadRadius: 0,
                                                blurRadius: 0,
                                                offset: Offset(0, 3))
                                          ],
                                        ),
                                        child: Container(
                                          width: 82,
                                          height: 60,
                                          child: Column(children: [
                                            SizedBox(height: 8),
                                            const Text(
                                              '#3',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: AppColors.bronzeStamped,
                                                shadows: [
                                                  Shadow(
                                                    offset: Offset(1.0,
                                                        1.0), // Lätt förskjuten skugga ger djup
                                                    blurRadius:
                                                        2.0, // En liten suddighet för realism // Halvtransparent svart för mjuk skugga
                                                  ),
                                                ],
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              ints[topThreeIndices[2]]
                                                  .toString(),
                                              style: baseStyle,
                                            ),
                                          ]),
                                        ),
                                      ),
                                    )
                                  ]),
                                ],
                              ],
                            ]),
                            SizedBox(
                              height: 66,
                            ),
                            if (dataDays[widget.mode]! > 0) ...[
                              if (stats.numberOfDays! < dataDays[widget.mode]!)
                                Text(
                                    'Data for ${stats.numberOfDays} of ${dataDays[widget.mode]} days',
                                    style: propStyle)
                            ],
                          ],
                        ),
                      ),
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
