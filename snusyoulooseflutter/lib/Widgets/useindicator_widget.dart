import 'package:flutter/material.dart';

import '../Config/app_strings.dart';
import '../Services/app_services.dart';

class UseIndicatorWidget extends StatefulWidget {
  const UseIndicatorWidget({super.key});

  @override
  State<UseIndicatorWidget> createState() => _UseIndicatorWidgetState();
}

class _UseIndicatorWidgetState extends State<UseIndicatorWidget> {
  @override
  FutureBuilder build(BuildContext context) {
    var userId = getUserIdService(context);
    return FutureBuilder(
      future: fetchUsedAndRemaingSnuffToday(userId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show a loading spinner while waiting
        } else if (snapshot.hasError) {
          return Text(''); // Show error if something went wrong
        } else {
          return Container(
            child: SizedBox(
              height: 50,
              width: 126,
              child: Column(children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 1),
                      child: Text(
                        AppStrings.used + " | " + AppStrings.remaining,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        snapshot.data[0].toString() +
                            "      |    " +
                            snapshot.data[1].toString(),
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    )
                  ],
                )
              ]),
            ),
          );
        }
      },
    );
  }
}
