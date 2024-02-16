import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Model/HabitDto.dart';

import '../Model/CurrentSnuffDto.dart';
import '../Model/ProgressionDto.dart';
import '../Model/Snuff.dart';
import '../Model/User.dart';
import '../Services/app_services.dart';

class AppState extends ChangeNotifier {
  List<CurrentSnuffDto> inventorySnuffs;
  List<Snuff> snuffsDetailsInInventory;
  Snuff? selectedSnuff;
  HabitDto? habit;
  User? user;
  ProgressionDto? progressionState;
  bool getPregressionFailed;
  Duration? timeLeft;

  AppState({
    this.inventorySnuffs = const [],
    this.snuffsDetailsInInventory = const [],
    this.selectedSnuff,
    this.habit,
    this.user,
    this.progressionState,
    this.getPregressionFailed = false,
    this.timeLeft,
  });

  Future<void> fetchInventorySnuffs() async {
    // Call your API here
    inventorySnuffs = await fetchUsersInventoryService(user!.UserId!);
    notifyListeners();
  }

  Future<void> fetchProgressionState() async {
    // Call your API here
    progressionState = await fetchUserProgressionService(user!.UserId!);
    notifyListeners();
  }
}
