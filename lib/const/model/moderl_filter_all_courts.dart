import 'package:flutter/foundation.dart';

import '../value/enum.dart';
import '../value/keys.dart';

class ModelCourtFilter {
  final List<SeoulDistrict> selectedDistricts;

  const ModelCourtFilter({
    required this.selectedDistricts,
  });

  Map<String, dynamic> toJson() {
    return {
      keyCourtDistrict: selectedDistricts.map((e) => e.name).toList(),
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ModelCourtFilter &&
              listEquals(selectedDistricts, other.selectedDistricts);

  @override
  int get hashCode => selectedDistricts.hashCode;
}