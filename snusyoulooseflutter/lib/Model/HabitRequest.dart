import 'package:snusyoulooseflutter/Model/Habit.dart';

import '../Model/HabitDto.dart';

class HabitRequest {
  String userId;
  HabitDto habitDto;

  HabitRequest(this.userId, this.habitDto);

  factory HabitRequest.fromJson(Map<String, dynamic> json) => HabitRequest(
        json['userId'] as String,
        HabitDto.fromJson(json['habitDto']),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['habitDto'] = this.habitDto.toJson();
    return data;
  }
}
