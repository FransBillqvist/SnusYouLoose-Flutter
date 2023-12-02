import 'Snuff.dart';

class Stock {
  String UserId;
  List<BoughtSnuff> SnuffStock;
  List<BoughtSnuff> SnuffHistory;

  Stock(this.UserId, this.SnuffStock, this.SnuffHistory);
}
