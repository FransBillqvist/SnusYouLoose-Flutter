import '../Model/Habit.dart';
import '../Model/Snuff.dart';
import '../Model/User.dart';

class AppState {
  List<Snuff> snuffs;
  Habit? habit;
  User? user;

  AppState({this.snuffs = const [], this.habit, this.user});
}
