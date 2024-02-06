import 'dart:convert' as JSON;

class HabitDto {
  String doseType;
  int doseAmount;
  String progressionType;
  int speed;
  int numberOfHoursPerDay;
  DateTime startDate;
  DateTime endDate;
  Duration wakeUpTime;
  Duration bedTime;

  HabitDto(
      this.doseType,
      this.doseAmount,
      this.progressionType,
      this.speed,
      this.numberOfHoursPerDay,
      this.startDate,
      this.endDate,
      this.wakeUpTime,
      this.bedTime);

  factory HabitDto.fromJson(Map<String, dynamic> json) => HabitDto(
        json['doseType'] as String,
        json['doseAmount'] as int,
        json['progressionType'] as String,
        json['speed'] as int,
        json['numberOfHoursPerDay'] as int,
        DateTime.parse(json['startDate'] as String),
        DateTime.parse(json['endDate'] as String),
        parseTime(json['wakeUpTime'] as String),
        parseTime(json['bedTime'] as String),
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
    data['WakeUpTime'] =
        '${wakeUpTime.inHours.toString().padLeft(2, '0')}:${(wakeUpTime.inMinutes % 60).toString().padLeft(2, '0')}:${(wakeUpTime.inSeconds % 60).toString().padLeft(2, '0')}';
    data['BedTime'] =
        '${bedTime.inHours.toString().padLeft(2, '0')}:${(bedTime.inMinutes % 60).toString().padLeft(2, '0')}:${(bedTime.inSeconds % 60).toString().padLeft(2, '0')}';
    return data;
  }
}

Duration parseTime(String time) {
  List<String> parts = time.split(':');
  return Duration(
    hours: int.parse(parts[0]),
    minutes: int.parse(parts[1]),
    seconds: int.parse(parts[2]),
  );
}
