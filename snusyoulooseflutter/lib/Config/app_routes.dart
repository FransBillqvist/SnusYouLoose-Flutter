import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../Pages/home_page.dart';
import '../Pages/login_page.dart';
import '../Redux/app_state.dart';

class AppRoutes {
  static final pages = {
    login: (context) => LoginPage(),
    home: (context) => _checkAuth(context, HomePage()),
  };

  static const String login = '/';
  static const String home = '/home';

  static Widget _checkAuth(BuildContext context, Widget page) {
    var store = StoreProvider.of<AppState>(context);
    return store.state.user != null ? page : LoginPage();
  }
}
