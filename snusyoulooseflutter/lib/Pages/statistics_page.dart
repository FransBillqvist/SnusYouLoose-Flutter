import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Model/StatisticDto.dart';

import '../Config/app_routes.dart';
import '../Config/app_strings.dart';
import '../Services/app_services.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  final List<String> _pages = [
    AppStrings.todays,
    AppStrings.week,
    AppStrings.twoWeek,
    AppStrings.month,
    AppStrings.quarter,
    AppStrings.year,
    AppStrings.allTime
  ];
  int _selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final userId = getUserIdService(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Positioned(
              top: 25,
              left: 15,
              child: ElevatedButton(
                  onPressed: () => Navigator.of(context)
                      .pushReplacementNamed(AppRoutes.home),
                  child: Icon(Icons.home_filled))),
          const Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 140),
            child: SizedBox(
                height: 500,
                width: 380,
                child: ColoredBox(
                  color: Colors.blue,
                )),
          ),
          Positioned(top: 140, left: 15, child: Placeholder())
        ]),
      ),
    );
  }
}
