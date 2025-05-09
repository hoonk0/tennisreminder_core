import '../value/enum.dart';

class ModelCourtFilter {
  final List<SeoulDistrict> selectedDistricts;

  const ModelCourtFilter({
    required this.selectedDistricts,
  });

  Map<String, dynamic> toJson() {
    return {
      'selectedDistricts': selectedDistricts.map((e) => e.name).toList(),
    };
  }
}
