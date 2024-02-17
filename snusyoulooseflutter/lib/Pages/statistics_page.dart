import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Model/StatisticDto.dart';

import '../Config/app_routes.dart';
import '../Services/app_services.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    final userId = getUserIdService(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<StatisticDto>(
          future: fetchDailyStatisticService(userId),
          builder: (context, snapshot) {
            return Stack(children: [
              Positioned(
                  top: 55,
                  left: 125,
                  child: ElevatedButton(
                      onPressed: () => Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.home),
                      child: Icon(Icons.home_filled))),
              Positioned(top: 75, left: 145, child: Placeholder())
            ]);
          },
        ),
      ),
    );
  }
}
