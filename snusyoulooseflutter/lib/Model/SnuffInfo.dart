import 'Enums/Flavor.dart';
import 'Enums/Format.dart';

class Snuffinfo {
  String snusId;
  double nicotinePerGram;
  double nicotinePerPortion;
  List<Flavor> flavors;
  Format format;

  Snuffinfo(this.snusId, this.nicotinePerGram, this.nicotinePerPortion,
      this.flavors, this.format);

  factory Snuffinfo.fromJson(Map<String, dynamic> json) => Snuffinfo(
        json['snusId'] as String,
        json['nicotinePerGram'] as double,
        json['nicotinePerPortion'] as double,
        (json['flavors'] as List<dynamic>)
            .map((e) => flavorFromInt(e as int)!)
            .toList(),
        formatFromInt(json['format'] as int) ?? Format.normal,
      );
}
