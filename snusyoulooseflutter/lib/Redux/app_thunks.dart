import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:snusyoulooseflutter/Model/HabitDto.dart';

import '../Config/app_routes.dart';
import '../Model/HabitRequest.dart';
import '../Services/app_services.dart';
import 'app_state.dart';
import 'actions.dart';
import '/Config/app_urls.dart'; // Importera din HTTP-service

ThunkAction<AppState> doLogin(
    String email, String password, BuildContext context) {
  return (Store<AppState> store) async {
    try {
      final loginResponse = await loginRequest(
          email, password); // Ersätt med din faktiska inloggningslogik
      print("this is the loginResponse: $loginResponse ");
      print(loginResponse.UserId!);
      final userDetails = await fetchUserDetails(
          loginResponse.UserId!); // Hämta användaruppgifter
      print("this is the userDetails: $userDetails ");

      store.dispatch(SignInUserAction(userDetails));
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);

      // Dispatcha SignInUserAction med användardetaljer
    } catch (error) {
      SnackBar(
        content: Text('Error '),
      );
    }
  };
}

ThunkAction<AppState> getSnuffInventory(String userId) {
  return (Store<AppState> store) async {
    try {
      final snuffInventory = await fetchUsersInventoryService(userId);
      store.dispatch(FetchInventoryAction(snuffInventory));
    } catch (error) {
      print(error);
    }
  };
}

ThunkAction<AppState> getUserHabit(String userId, BuildContext context) {
  return (Store<AppState> store) async {
    try {
      final userHabit = await fetchUserHabitService(userId, context);
      store.dispatch(FetchHabitsAction(userHabit));
    } catch (error) {
      print(error);
    }
  };
}

ThunkAction<AppState> createHabit(
    HabitDto habitRequest, String userId, BuildContext context) {
  return (Store<AppState> store) async {
    try {
      final newHabit = await createHabitService(habitRequest, userId);
      store.dispatch(CreateHabitAction(newHabit));
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    } catch (error) {
      print(error);
    }
  };
}

ThunkAction<AppState> getPregression(String userId) {
  return (Store<AppState> store) async {
    try {
      final progression = await fetchUserProgressionService(userId);
      store.dispatch(FetchProgressionAction(progression));
    } catch (error) {
      print(error);
    }
  };
}
