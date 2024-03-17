class NicotineStats {
  double primaryNicotineUse;
  int primaryNumberOfDays;
  double secondaryNicotineUse;
  int secondaryNumberOfDays;
  double indicationScore;

  NicotineStats(
      this.primaryNicotineUse,
      this.primaryNumberOfDays,
      this.secondaryNicotineUse,
      this.secondaryNumberOfDays,
      this.indicationScore);

  factory NicotineStats.fromJson(Map<String, dynamic> json) => NicotineStats(
        (json['primaryNicotineUse'] as num).toDouble(),
        json['primaryNumberOfDays'] as int,
        (json['secondaryNicotineUse'] as num).toDouble(),
        json['secondaryNumberOfDays'] as int,
        (json['indicationScore'] as num).toDouble(),
      );
}
