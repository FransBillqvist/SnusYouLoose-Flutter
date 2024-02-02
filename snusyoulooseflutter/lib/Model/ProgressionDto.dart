class ProgressionDto {
  final DateTime goalStartDate;
  final DateTime goalEndDate;
  final int snuffLimitAmount;
  final Duration recommendedUsageInterval;
  final Duration actualUsageInterval;
  final bool inUse;

  ProgressionDto(
      {required this.goalStartDate,
      required this.goalEndDate,
      required this.snuffLimitAmount,
      required this.recommendedUsageInterval,
      required this.actualUsageInterval,
      required this.inUse});

  factory ProgressionDto.fromJson(Map<String, dynamic> json) => ProgressionDto(
        goalStartDate: DateTime.parse(json['goalStartDate']),
        goalEndDate: DateTime.parse(json['goalEndDate']),
        snuffLimitAmount: json['snuffLimitAmount'],
        recommendedUsageInterval:
            Duration(seconds: json['recommendedUsageInterval']),
        actualUsageInterval: Duration(seconds: json['actualUsageInterval']),
        inUse: json['inUse'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['goalStartDate'] = goalStartDate.toIso8601String();
    data['goalEndDate'] = goalEndDate.toIso8601String();
    data['snuffLimitAmount'] = snuffLimitAmount;
    data['recommendedUsageInterval'] = recommendedUsageInterval;
    data['inUse'] = inUse;
    return data;
  }
}
