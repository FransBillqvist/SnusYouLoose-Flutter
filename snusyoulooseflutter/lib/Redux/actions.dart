import 'package:snusyoulooseflutter/Model/CurrentSnuff.dart';
import 'package:snusyoulooseflutter/Model/HabitDto.dart';

import '../Model/CurrentSnuffDto.dart';
import '../Model/ProgressionDto.dart';
import '../Model/Snuff.dart';
import '../Model/User.dart';

class UpdateSnuffAction {
  final CurrentSnuff updatedSnuff;

  UpdateSnuffAction(this.updatedSnuff);
}

class CreateHabitAction {
  final HabitDto habit;

  CreateHabitAction(this.habit);
}

class FetchHabitsAction {
  final HabitDto habits;

  FetchHabitsAction(this.habits);
}

class SignInUserAction {
  final User user;

  SignInUserAction(this.user);
}

class SignOutUserAction {
  final User user;

  SignOutUserAction(this.user);
}

class SelectSnuffAction {
  final Snuff snuff;

  SelectSnuffAction(this.snuff);
}

class FetchInventoryAction {
  final List<CurrentSnuffDto> inventory;

  FetchInventoryAction(this.inventory);
}

class FetchSnuffDetailsAction {
  final List<Snuff> snuffs;

  FetchSnuffDetailsAction(this.snuffs);
}

class FetchProgressionAction {
  final ProgressionDto progression;

  FetchProgressionAction(this.progression);
}

class CreateProgressionAction {
  final ProgressionDto progression;

  CreateProgressionAction(this.progression);
}

class GetProgressionFailedAction {
  final bool getPregressionFailed;

  GetProgressionFailedAction(this.getPregressionFailed);
}
