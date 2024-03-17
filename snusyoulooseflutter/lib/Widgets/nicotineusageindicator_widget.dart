import 'package:flutter/material.dart';

import '../Model/NicotineStats.dart';
import '../Services/app_services.dart';

class NicotineUsageIndicatorWidget extends StatelessWidget {
  final String userId;
  final String period;

  NicotineUsageIndicatorWidget({required this.userId, required this.period});

  @override
  Widget build(BuildContext context) {
    Stream<NicotineStats>? nicotineStatsStream =
        fetchNicotineStatsStream(userId, period) as Stream<NicotineStats>?;
    return StreamBuilder<NicotineStats>(
      stream: nicotineStatsStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while fetching data
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Show an error message if there's an error
          return Text('Error: ${snapshot.error}');
        } else {
          // Calculate rotation angle outside the return statement
          double rotationAngle = 0;
          if (snapshot.data?.indicationScore != null) {
            double indicationScore = snapshot.data!.indicationScore;
            if (indicationScore < 1) {
              rotationAngle = -90 * (1 - indicationScore);
            } else if (indicationScore > 1) {
              rotationAngle = 90 * (indicationScore - 1);
            }
          }

          // Display the nicotine usage indicator widget
          return Container(
            width: 100,
            height: 100,
            // Use the previously calculated angle
            child: Icon(
              Icons.arrow_forward,
              size: 50,
            ),
          );
        }
      },
    );
  }
}
