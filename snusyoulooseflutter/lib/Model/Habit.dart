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
}
