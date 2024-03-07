import 'SnuffInfo.dart';

class Snuff {
  String id;
  String Brand;
  String Type;
  int Price;
  int DefaultAmount;
  String ImageUrl;
  int Size;
  Snuffinfo? snuffInfo;
  // bool selected;

  Snuff(this.id, this.Brand, this.Type, this.Price, this.DefaultAmount,
      this.ImageUrl, this.Size, this.snuffInfo);

  factory Snuff.fromJson(Map<String, dynamic> json) => Snuff(
        json['id'] as String,
        json['brand'] as String,
        json['type'] as String,
        json['price'] as int,
        json['defaultAmount'] as int,
        json['imageUrl'] as String,
        json['size'] as int,
        Snuffinfo.fromJson(json['snuffInfo']),
        // json['selected'] as bool,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'brand': Brand,
        'type': Type,
        'price': Price,
        'defaultAmount': DefaultAmount,
        'imageUrl': ImageUrl,
        'size': Size,
      };
}
