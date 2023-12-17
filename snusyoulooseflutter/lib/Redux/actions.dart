import '../Model/Habit.dart';
import '../Model/Snuff.dart';
import '../Model/User.dart';

class UpdateSnuffAction {
  final Snuff updatedSnuff;

  UpdateSnuffAction(this.updatedSnuff);
}

class CreateHabitAction {
  final Habit habit;

  CreateHabitAction(this.habit);
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
