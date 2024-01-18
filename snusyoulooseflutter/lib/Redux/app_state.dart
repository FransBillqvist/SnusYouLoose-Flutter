import 'package:snusyoulooseflutter/Model/CurrentSnuff.dart';
import 'package:snusyoulooseflutter/Model/HabitDto.dart';

import '../Model/CurrentSnuffDto.dart';
import '../Model/Habit.dart';
import '../Model/Snuff.dart';
import '../Model/User.dart';

class AppState {
  List<CurrentSnuffDto> inventorySnuffs;
  List<Snuff> snuffsDetailsInInventory;
  Snuff? selectedSnuff;
  HabitDto? habit;
  User? user;

  AppState(
      {this.inventorySnuffs = const [],
      this.snuffsDetailsInInventory = const [],
      this.selectedSnuff,
      this.habit,
      this.user});
}
