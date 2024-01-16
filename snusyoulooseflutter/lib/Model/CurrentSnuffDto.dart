class CurrentSnuffDto {
  final String currentSnuffId;
  final String imageUrl;
  final String brand;
  final String type;
  final int amountRemaing;
  final DateTime purchaseDate;

  CurrentSnuffDto(this.currentSnuffId, this.imageUrl, this.brand, this.type,
      this.amountRemaing, this.purchaseDate);

  factory CurrentSnuffDto.fromJson(Map<String, dynamic> json) =>
      CurrentSnuffDto(
        json['currentSnuffId'] as String,
        json['imageUrl'] as String,
        json['brand'] as String,
        json['type'] as String,
        json['amountRemaing'] as int,
        DateTime.parse(json['purchaseDate'] as String),
      );
}
