import 'dart:ffi';

import 'Enums/Flavor.dart';
import 'Enums/Format.dart';

class SnuffInfoDto {
  final String snusId;
  final Double nicotinePerGram;
  final Double nicotinePerPerPortion;
  final List<Flavor> flavors;
  final Format format;

  SnuffInfoDto(this.snusId, this.nicotinePerGram, this.nicotinePerPerPortion,
      this.flavors, this.format);
  factory SnuffInfoDto.fromJson(Map<String, dynamic> json) => SnuffInfoDto(
        json['snusId'] as String,
        json['nicotinePerGram'] as Double,
        json['nicotinePerPerPortion'] as Double,
        json['flavors'] as List<Flavor>,
        json['format'] as Format,
      );

  Map<String, dynamic> toJson() => {
        'snusId': snusId,
        'nicotinePerGram': nicotinePerGram,
        'nicotinePerPerPortion': nicotinePerPerPortion,
        'flavors': flavors,
        'format': format,
      };
}
