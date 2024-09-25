import 'package:hotel_booking/features/hotels/data/models/overall_attribute_model.dart';
import 'package:hotel_booking/features/hotels/domain/entities/overall.dart';

class OverallModel extends Overall {
  OverallModel({
    required super.attributes,
    required super.boarding,
    required super.name,
    required super.adultCount,
    required super.childrenAges,
    required super.childrenCount,
    required super.quantity,
    required super.sameBoarding,
    required super.sameRoomGroups,
  });

  factory OverallModel.fromJson(Map<String, dynamic> json) => OverallModel(
        attributes: List<OverallAttributeModel>.from(json["attributes"].map((x) => OverallAttributeModel.fromJson(x))),
        boarding: json["boarding"],
        name: json["name"],
        adultCount: json["adult-count"],
        childrenAges: List<dynamic>.from(json["children-ages"].map((x) => x)),
        childrenCount: json["children-count"],
        quantity: json["quantity"],
        sameBoarding: json["same-boarding"],
        sameRoomGroups: json["same-room-groups"],
      );
}
