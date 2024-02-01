class Snuff {
  String id;
  String Brand;
  String Type;
  int Price;
  int DefaultAmount;
  String ImageUrl;
  int Size;
  // bool selected;

  Snuff(this.id, this.Brand, this.Type, this.Price, this.DefaultAmount,
      this.ImageUrl, this.Size);

  factory Snuff.fromJson(Map<String, dynamic> json) => Snuff(
        json['id'] as String,
        json['brand'] as String,
        json['type'] as String,
        json['price'] as int,
        json['defaultAmount'] as int,
        json['imageUrl'] as String,
        json['size'] as int,
        // json['selected'] as bool,
      );
}
