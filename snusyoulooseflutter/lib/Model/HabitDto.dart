import 'dart:convert' as JSON;

class HabitDto {
  String doseType;
  int doseAmount;
  String progressionType;
  int speed;
  int numberOfHoursPerDay;
  DateTime startDate;
  DateTime endDate;

  HabitDto(this.doseType, this.doseAmount, this.progressionType, this.speed,
      this.numberOfHoursPerDay, this.startDate, this.endDate);

  factory HabitDto.fromJson(Map<String, dynamic> json) => HabitDto(
        json['doseType'] as String,
        json['doseAmount'] as int,
        json['progressionType'] as String,
        json['speed'] as int,
        json['numberOfHoursPerDay'] as int,
        DateTime.parse(json['startDate'] as String),
        DateTime.parse(json['endDate'] as String),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['DoseType'] = doseType;
    data['DoseAmount'] = doseAmount;
    data['ProgressionType'] = progressionType;
    data['Speed'] = speed;
    data['NumberOfHoursPerDay'] = numberOfHoursPerDay;
    data['StartDate'] = startDate.toIso8601String();
    data['EndDate'] = endDate.toIso8601String();
    return data;
  }
}
