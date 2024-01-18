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
        DateTime.parse(json['startDate']),
        DateTime.parse(json['endDate']),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doseType'] = this.doseType;
    data['doseAmount'] = this.doseAmount;
    data['progressionType'] = this.progressionType;
    data['speed'] = this.speed;
    data['numberOfHoursPerDay'] = this.numberOfHoursPerDay;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    return data;
  }
}
