import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../Services/app_services.dart';
import 'app_state.dart';
import 'actions.dart';
import '/Config/app_urls.dart'; // Importera din HTTP-service

ThunkAction<AppState> doLogin(String email, String password) {
  return (Store<AppState> store) async {
    try {
      final loginResponse = await loginRequest(
          email, password); // Ersätt med din faktiska inloggningslogik
      final userDetails = await fetchUserDetails(
          loginResponse.UserId!); // Hämta användaruppgifter

      store.dispatch(SignInUserAction(
          userDetails)); // Dispatcha SignInUserAction med användardetaljer
    } catch (error) {
      SnackBar(
        content: Text('Error '),
      );
    }
  };
}
