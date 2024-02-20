import 'Snuff.dart';

class StatisticDto {
  String userId;
  List<Snuff> usedSnuffSorts;
  List<int> usedAmountOfSnuffs;
  int totalAmoutUsed;
  int limitOfUse;
  double rating;
  String createdDate;
  int? numberOfDays;

  StatisticDto(
      this.userId,
      this.usedSnuffSorts,
      this.usedAmountOfSnuffs,
      this.totalAmoutUsed,
      this.limitOfUse,
      this.rating,
      this.createdDate,
      this.numberOfDays);

  factory StatisticDto.fromJson(Map<String, dynamic> json) => StatisticDto(
      json['userId'] as String,
      (json['usedSnuffSorts'] as List).map((e) => Snuff.fromJson(e)).toList(),
      (json['usedAmountOfSnuffs'] as List).map((e) => e as int).toList(),
      json['totalAmoutUsed'] as int,
      json['limitOfUse'] as int,
      (json['rating'] as num).toDouble(),
      json['createdDate'] as String,
      json['numberOfDays'] as int?);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    if (this.usedSnuffSorts != null) {
      data['usedSnuffSorts'] =
          this.usedSnuffSorts!.map((v) => v.toJson()).toList();
    }
    data['usedAmountOfSnuffs'] = this.usedAmountOfSnuffs;
    data['totalAmoutUsed'] = this.totalAmoutUsed;
    data['limitOfUse'] = this.limitOfUse;
    data['rating'] = this.rating;
    data['createdDate'] = this.createdDate;
    data['numberOfDays'] = this.numberOfDays;
    return data;
  }
}
