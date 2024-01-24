import 'dart:convert' as JSON;

class HabitDto {
  String doseType;
  int doseAmount;
  String progressionType;
  String speed;
  int numberOfHoursPerDay;
  DateTime startDate;
  DateTime endDate;

  HabitDto(this.doseType, this.doseAmount, this.progressionType, this.speed,
      this.numberOfHoursPerDay, this.startDate, this.endDate);

  factory HabitDto.fromJson(Map<String, dynamic> json) => HabitDto(
        json['doseType'] as String,
        json['doseAmount'] as int,
        json['progressionType'] as String,
        json['speed'] as String,
        json['numberOfHoursPerDay'] as int,
        DateTime.parse(json['startDate'] as String),
        DateTime.parse(json['endDate'] as String),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doseType'] = this.doseType;
    data['doseAmount'] = this.doseAmount;
    data['progressionType'] = this.progressionType;
    data['speed'] = this.speed;
    data['numberOfHoursPerDay'] = this.numberOfHoursPerDay;
    data['startDate'] = this.startDate.toIso8601String();
    data['endDate'] = this.endDate.toIso8601String();
    return data;
  }
}
