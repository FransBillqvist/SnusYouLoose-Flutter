import '../Model/Habit.dart';
import '../Model/Snuff.dart';
import '../Model/User.dart';

class AppState {
  List<Snuff> snuffs;
  Snuff? selectedSnuff;
  Habit? habit;
  User? user;

  AppState({this.snuffs = const [], this.selectedSnuff, this.habit, this.user});
}
