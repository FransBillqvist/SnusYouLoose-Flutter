import '../Pages/home_page.dart';
import '../Pages/login_page.dart';

class AppRoutes {
  static final pages = {
    login: (context) => LoginPage(),
    home: (context) => HomePage(),
  };

  static const String login = '/';
  static const String home = '/home';
}
