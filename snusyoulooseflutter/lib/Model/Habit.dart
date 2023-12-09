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
      this.StringEndDate);

  factory Habit.fromJson(Map<String, dynamic> json) {
    var userid = json['UserId'];
    var doseType = json['DoseType'];
    var doseAmount = json['DoseAmount'];
    var progressionType = json['ProgressionType'];
    var speed = json['Speed'];
    var numberOfHoursPerDay = json['NumberOfHoursPerDay'];
    var startDate = DateTime.parse(json['StartDate']);
    var endDate = DateTime.parse(json['EndDate']);
    var stringStartDate = json['StringStartDate'];
    var stringEndDate = json['StringEndDate'];

    return Habit(
      userid,
      doseType,
      doseAmount,
      progressionType,
      speed,
      numberOfHoursPerDay,
      startDate,
      endDate,
      stringStartDate,
      stringEndDate,
    );
  }
}
