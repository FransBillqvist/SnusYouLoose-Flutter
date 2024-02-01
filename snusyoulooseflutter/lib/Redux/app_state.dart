import 'package:snusyoulooseflutter/Model/HabitDto.dart';

import '../Model/CurrentSnuffDto.dart';
import '../Model/ProgressionDto.dart';
import '../Model/Snuff.dart';
import '../Model/User.dart';

class AppState {
  List<CurrentSnuffDto> inventorySnuffs;
  List<Snuff> snuffsDetailsInInventory;
  Snuff? selectedSnuff;
  HabitDto? habit;
  User? user;
  ProgressionDto? progressionState;

  AppState(
      {this.inventorySnuffs = const [],
      this.snuffsDetailsInInventory = const [],
      this.selectedSnuff,
      this.habit,
      this.user,
      this.progressionState});
}
