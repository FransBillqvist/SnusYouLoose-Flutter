import 'package:snusyoulooseflutter/Model/CurrentSnuff.dart';

import '../Model/Habit.dart';
import '../Model/Snuff.dart';
import '../Model/User.dart';

class AppState {
  List<CurrentSnuff> inventorySnuffs;
  Snuff? selectedSnuff;
  Habit? habit;
  User? user;

  AppState(
      {this.inventorySnuffs = const [],
      this.selectedSnuff,
      this.habit,
      this.user});
}
