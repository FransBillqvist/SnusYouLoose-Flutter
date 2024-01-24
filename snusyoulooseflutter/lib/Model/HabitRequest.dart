import 'package:snusyoulooseflutter/Model/Habit.dart';

import '../Model/HabitDto.dart';

class HabitRequest {
  String UserId;
  HabitDto Habit;

  HabitRequest(this.UserId, this.Habit);

  factory HabitRequest.fromJson(Map<String, dynamic> json) => HabitRequest(
        json['userId'] as String,
        HabitDto.fromJson(json['habit']),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserId'] = this.UserId;
    data['Habit'] = this.Habit.toJson();
    return data;
  }
}
