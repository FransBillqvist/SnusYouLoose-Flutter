import 'package:snusyoulooseflutter/Model/CurrentSnuff.dart';

import '../Model/Habit.dart';
import '../Model/Snuff.dart';
import '../Model/User.dart';

class AppState {
  List<CurrentSnuff> snuffs;
  Snuff? selectedSnuff;
  Habit? habit;
  User? user;

  AppState({this.snuffs = const [], this.selectedSnuff, this.habit, this.user});
}
