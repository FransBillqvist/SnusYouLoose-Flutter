import 'package:flutter/material.dart';

class Snuff {
  String id;
  String Brand;
  String Type;
  int Price;
  int DefaultAmount;
  String ImageUrl;
  int Size;
  bool selected;

  Snuff(this.id, this.Brand, this.Type, this.Price, this.DefaultAmount,
      this.ImageUrl, this.Size, this.selected);
  factory Snuff.fromJson(Map<String, dynamic> json) {
    var id = json['id'];
    var Brand = json['Brand'];
    var Type = json['Type'];
    var Price = json['Price'];
    var DefaultAmount = json['DefaultAmount'];
    var ImageUrl = json['ImageUrl'];
    var Size = json['Size'];
    var selected = json['selected'];

    return Snuff(
        id, Brand, Type, Price, DefaultAmount, ImageUrl, Size, selected);
  }
}
