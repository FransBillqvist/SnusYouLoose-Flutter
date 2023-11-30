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
}
