import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Model/StatisticDto.dart';
import 'package:snusyoulooseflutter/Styles/app_colors.dart';

import '../Config/app_routes.dart';
import '../Config/app_strings.dart';
import '../Services/app_services.dart';

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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _pages.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var yesterday = DateTime.now().subtract(Duration(days: 1));
    var lastWeek = DateTime.now().subtract(Duration(days: 8));
    var twoWeeksAgo = DateTime.now().subtract(Duration(days: 15));
    var lastMonth = DateTime.now().subtract(Duration(days: 31));
    var lastQuarter = DateTime.now().subtract(Duration(days: 91));
    var lastYear = DateTime.now().subtract(Duration(days: 366));
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
        children: _pages.map((String page) {
          return Center(
              child: Text(
            'This is the $page page',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ));
        }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
