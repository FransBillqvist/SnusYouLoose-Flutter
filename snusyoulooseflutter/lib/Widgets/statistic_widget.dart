import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Model/StatisticDto.dart';

import '../Services/app_services.dart';

class StatisticWidget extends StatefulWidget {
  late int mode;
  StatisticWidget({super.key});

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
    return const Placeholder();
  }

  Future<StatisticDto> fetchData(String mode, String userId) async {
    switch (mode) {
      case 0:
        return await fetchDailyStatisticService(userId);
      case 1:
        return await apiCall2();
      case 2:
        return await apiCall3();
      case 3:
        return await apiCall3();
      case 4:
        return await apiCall3();
      case 5:
        return await apiCall3();
      default:
        throw Exception('Invalid mode: $mode');
    }
  }
}
