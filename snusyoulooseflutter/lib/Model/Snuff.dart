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

class BoughtSnuff {
  Snuff snuff;
  DateTime BoughtDate;
  DateTime FirstDoseDate;
  int AmountLeft;
  bool InUse;
  bool Empty;

  BoughtSnuff(this.snuff, this.BoughtDate, this.FirstDoseDate, this.AmountLeft,
      this.InUse, this.Empty);
}
