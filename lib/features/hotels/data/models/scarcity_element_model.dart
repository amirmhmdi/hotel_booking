import 'package:hotel_booking/features/hotels/domain/entities/scarcity_element.dart';

class ScarcityElementModel extends ScarcityElement {
  ScarcityElementModel({
    required super.type,
  });

  factory ScarcityElementModel.fromDomain(ScarcityElement scarcityElement) => ScarcityElementModel(
        type: scarcityElement.type,
      );

  factory ScarcityElementModel.fromJson(Map<String, dynamic> json) => ScarcityElementModel(
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
      };
}
