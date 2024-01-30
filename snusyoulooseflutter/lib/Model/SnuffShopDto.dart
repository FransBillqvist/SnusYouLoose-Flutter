class SnuffShopDto {
  final String id;
  final String brand;
  final String type;
  final int price;
  final int defaultAmount;
  final String imageUrl;
  late int? amount;

  SnuffShopDto(this.id, this.brand, this.type, this.price, this.defaultAmount,
      this.imageUrl);

  factory SnuffShopDto.fromJson(Map<String, dynamic> json) => SnuffShopDto(
        json['id'] as String,
        json['brand'] as String,
        json['type'] as String,
        json['price'] as int,
        json['defaultAmount'] as int,
        json['imageUrl'] as String,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brand'] = this.brand;
    data['type'] = this.type;
    data['price'] = this.price;
    data['defaultAmount'] = this.defaultAmount;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
