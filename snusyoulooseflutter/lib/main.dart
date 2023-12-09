import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'Model/Snuff.dart';
import 'Redux/app_state.dart';
import 'Config/app_routes.dart';
import 'Redux/reducer.dart';
import 'Styles/app_colors.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final Store<AppState> _store = Store<AppState>(
    appReducer,
    initialState: AppState(
      snuffs: [
        Snuff("1", "Skruf", "Original Portion2", 50, 20,
            "assets/images/skruf.png", 1, false),
        Snuff("7", "General", "Wintergreen Portion", 50, 20,
            "assets/images/general.png", 1, false),
        Snuff("8", "General", "White Portion", 50, 20,
            "assets/images/general.png", 1, false),
      ],
    ),
    middleware: [thunkMiddleware], // Lägg till thunkMiddleware här
  );

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
