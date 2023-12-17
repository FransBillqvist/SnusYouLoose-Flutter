import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'Model/Snuff.dart';
import 'Redux/app_state.dart';
import 'Config/app_routes.dart';
import 'Redux/app_middleware.dart';
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
        Snuff(
            "56",
            "Skruf",
            "Nordic Liquorice",
            47,
            20,
            "https://media.snusbolaget.se/snusbolaget/images/302187-g-2022-11-16-140021849/555/555/2/skruf-super-white-nordic-liquorice.png",
            200,
            false),
        Snuff(
            "7",
            "General",
            "Strong Slim White Portion",
            39,
            20,
            "https://media.snusbolaget.se/snusbolaget/images/201279-g-2023-11-20-141059496/555/555/2/xr-general-strong-slim-white-portion.png",
            200,
            false),
        Snuff(
            "8",
            "Grov",
            "Original Portion",
            47,
            20,
            "https://cdn.cdon.com/media-dynamic/images/product/cloud/store/Tobacco/000/042/375/402/91026774-172230647-11453-org.jpg?cache=133318297422833596&impolicy=product&width=",
            200,
            false),
      ],
    ),
    middleware: [thunkMiddleware, loggingMiddleware],
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
