class SnuffLog {
  final String id;
  final DateTime createdAtUtc;
  final String stringCreatedAtUtc;
  final String userId;
  final DateTime snuffLogDate;
  final int amountUsed;

  SnuffLog(this.userId, this.snuffLogDate, this.amountUsed, this.id,
      this.createdAtUtc, this.stringCreatedAtUtc);

  factory SnuffLog.fromJson(Map<String, dynamic> json) {
    var id = json['id'];
    var createdAtUtc = DateTime.parse(json['createdAtUtc']);
    var stringCreatedAtUtc = json['stringCreatedAtUtc'];
    var userId = json['userId'];
    var snuffLogDate = DateTime.parse(json['snuffLogDate']);
    var amountUsed = json['amountUsed'];

    return SnuffLog(
        id, createdAtUtc, stringCreatedAtUtc, userId, snuffLogDate, amountUsed);
  }
}
