import 'package:hotel_booking/features/hotels/domain/entities/overall_attribute.dart';

class OverallAttributeModel extends OverallAttribute {
  OverallAttributeModel({
    required super.id,
    required super.name,
    required super.value,
    required super.isUnique,
  });

  factory OverallAttributeModel.fromJson(Map<String, dynamic> json) => OverallAttributeModel(
        id: idValues.map[json["id"]]!,
        name: nameValues.map[json["name"]]!,
        value: json["value"],
        isUnique: json["is-unique"],
      );
}
