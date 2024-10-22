import "/Model/SnuffLog.dart";

class CurrentSnuff {
  final String id;
  final DateTime createdAtUtc;
  final String stringCreatedAtUtc;
  final String snusId;
  final String stringPurchaseDate;
  final List<SnuffLog>? logsOfBox;
  final String userId;
  final bool isEmpty;
  final bool isArchived;
  final int remainingAmount;

  CurrentSnuff(
    this.id,
    this.createdAtUtc,
    this.stringCreatedAtUtc,
    this.snusId,
    this.logsOfBox,
    this.userId,
    this.isEmpty,
    this.isArchived,
    this.remainingAmount,
    this.stringPurchaseDate,
  );

  factory CurrentSnuff.fromJson(Map<String, dynamic> json) => CurrentSnuff(
        json['id'] as String,
        json['createdAtUtc'] == null
            ? DateTime.now()
            : DateTime.parse(json['createdAtUtc']),
        json['stringCreatedAtUtc'] as String,
        json['snusId'] as String,
        (json['logsOfBox'] as List<dynamic>?)
            ?.map((item) => SnuffLog.fromJson(item as Map<String, dynamic>))
            .toList(),
        json['userId'] as String,
        json['isEmpty'] as bool,
        json['isArchived'] as bool,
        json['remainingAmount'] as int,
        json['stringPurchaseDate'] as String,
      );

  // var id = json['id'];
  // var createdAtUtc = DateTime.parse(json['createdAtUtc']);
  // var stringCreatedAtUtc = json['stringCreatedAtUtc'];
  // var snusId = json['snusId'];
  // var logsOfBox = (json['logsOfBox'] as List<dynamic>?)
  //     ?.map((item) => SnuffLog.fromJson(item as Map<String, dynamic>))
  //     .toList();
  // var userId = json['userId'];
  // var isEmpty = json['isEmpty'];
  // var isArchived = json['isArchived'];
  // var remainingAmount = json['remainingAmount'];
  // var stringPurchaseDate = json['stringPurchaseDate'];

  // return CurrentSnuff(
  //   id,
  //   createdAtUtc,
  //   stringCreatedAtUtc,
  //   snusId,
  //   logsOfBox,
  //   userId,
  //   isEmpty,
  //   isArchived,
  //   remainingAmount,
  //   stringPurchaseDate,
  // );
}
