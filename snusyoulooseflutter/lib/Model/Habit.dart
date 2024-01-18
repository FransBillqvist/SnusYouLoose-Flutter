class Habit {
  String UserId;
  String DoseType;
  int DoseAmount;
  String ProgressionType;
  String Speed;
  int NumberOfHoursPerDay;
  DateTime StartDate;
  DateTime EndDate;
  String StringStartDate;
  String StringEndDate;
  String Id;
  DateTime? CreatedAtUtc;
  String StringCreatedAtUtc;

  Habit(
      this.UserId,
      this.DoseType,
      this.DoseAmount,
      this.ProgressionType,
      this.Speed,
      this.NumberOfHoursPerDay,
      this.StartDate,
      this.EndDate,
      this.StringStartDate,
      this.StringEndDate,
      this.Id,
      this.CreatedAtUtc,
      this.StringCreatedAtUtc);

  factory Habit.fromJson(Map<String, dynamic> json) => Habit(
        json['userId'] as String,
        json['doseType'] as String,
        json['doseAmount'] as int,
        json['progressionType'] as String,
        json['speed'] as String,
        json['numberOfHoursPerDay'] as int,
        DateTime.parse(json['startDate']),
        DateTime.parse(json['endDate']),
        json['stringStartDate'] as String,
        json['stringEndDate'] as String,
        json['id'] as String,
        json['createdAtUtc'] == null
            ? null
            : DateTime.parse(json['createdAtUtc']),
        json['stringCreatedAtUtc'] as String,
      );

  // return Habit(
  //   userid,
  //   doseType,
  //   doseAmount,
  //   progressionType,
  //   speed,
  //   numberOfHoursPerDay,
  //   startDate,
  //   endDate,
  //   stringStartDate,
  //   stringEndDate,
  // );
}
