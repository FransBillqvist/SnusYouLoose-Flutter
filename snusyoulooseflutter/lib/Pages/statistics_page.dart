import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Model/StatisticDto.dart';
import 'package:snusyoulooseflutter/Styles/app_colors.dart';
import 'package:snusyoulooseflutter/Widgets/statistic_widget.dart';

import '../Config/app_routes.dart';
import '../Config/app_strings.dart';
import '../Services/app_services.dart';
import '../Widgets/nicotineusageindicator_widget.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage>
    with SingleTickerProviderStateMixin {
  final List<String> _pages = [
    AppStrings.todays,
    AppStrings.week,
    AppStrings.twoWeek,
    AppStrings.month,
    AppStrings.quarter,
    AppStrings.year,
    AppStrings.allTime
  ];
  late TabController _tabController;
  bool showHistory = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _pages.length, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final userId = getUserIdService(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.statistics),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.home)),
        backgroundColor: AppColors.cartBgLight,
        bottom: TabBar(
          controller: _tabController,
          dividerColor: AppColors.cartBgLight,
          isScrollable: true,
          tabs: _pages.map((String page) => Tab(text: page)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _pages.asMap().entries.map((entry) {
          int index = entry.key;
          String page = entry.value;
          return Column(
            children: [
              StatisticWidget(mode: index),
              if (page != AppStrings.allTime)
                NicotineUsageIndicatorWidget(userId: userId, period: page),
            ],
          );
        }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  void historyView() {
    setState(() {
      showHistory = !showHistory;
      print(showHistory);
    });
  }
}


// import 'package:flutter/material.dart';
// import 'package:snusyoulooseflutter/Model/StatisticDto.dart';

// import '../Config/app_routes.dart';
// import '../Config/app_strings.dart';
// import '../Services/app_services.dart';

// class StatisticsPage extends StatefulWidget {
//   const StatisticsPage({super.key});

//   @override
//   State<StatisticsPage> createState() => _StatisticsPageState();
// }

// class _StatisticsPageState extends State<StatisticsPage> {
//   final List<String> _pages = [
//     AppStrings.todays,
//     AppStrings.week,
//     AppStrings.twoWeek,
//     AppStrings.month,
//     AppStrings.quarter,
//     AppStrings.year,
//     AppStrings.allTime
//   ];
//   int _selectedPageIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     final userId = getUserIdService(context);
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Stack(children: [
//           Positioned(
//               top: 25,
//               left: 15,
//               child: ElevatedButton(
//                   onPressed: () => Navigator.of(context)
//                       .pushReplacementNamed(AppRoutes.home),
//                   child: Icon(Icons.home_filled))),

//           const Padding(
//             padding: const EdgeInsets.only(left: 16.0, top: 140),
//             child: SizedBox(
//                 height: 500,
//                 width: 380,
//                 child: ColoredBox(
//                   color: Colors.blue,
//                 )),
//           ),
//           Positioned(top: 140, left: 15, child: Placeholder())
//         ]),
//       ),
//     );
//   }
// }
