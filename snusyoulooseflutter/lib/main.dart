import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:snusyoulooseflutter/Config/app_routes.dart';
import 'package:snusyoulooseflutter/Redux/reducer.dart';
import 'package:snusyoulooseflutter/Styles/app_colors.dart';
import 'package:redux/redux.dart';

import 'Model/Snuff.dart';
import 'Redux/app_state.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final Store<AppState> _store = Store<AppState>(updatedSnuffReducer,
      initialState: AppState(
        snuffs: [
          Snuff("1", "Skruf", "Original Portion2", 50, 20,
              "assets/images/skruf.png", 1, false),
          Snuff("2", "Skruf", "Cranberry Portion", 50, 20,
              "assets/images/skruf.png", 1, false),
          Snuff("3", "Skruf", "Fresh Portion", 50, 20,
              "assets/images/skruf.png", 1, false),
          Snuff("4", "Skruf", "Slim Fresh White Portion", 50, 20,
              "assets/images/skruf.png", 1, false),
          Snuff("5", "General", "Original Portion", 50, 20,
              "assets/images/general.png", 1, false),
          Snuff("6", "General", "Mint Portion", 50, 20,
              "assets/images/general.png", 1, false),
          Snuff("7", "General", "Wintergreen Portion", 50, 20,
              "assets/images/general.png", 1, false),
          Snuff("8", "General", "White Portion", 50, 20,
              "assets/images/general.png", 1, false),
        ],
      ));
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: _store,
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Urbanist',
          scaffoldBackgroundColor: AppColors.example4,
          brightness: Brightness.dark,
        ),
        initialRoute: AppRoutes.login,
        routes: AppRoutes.pages,
      ),
    );
  }
}
