import 'package:hotel_booking/features/hotels/data/models/overall_attribute_model.dart';
import 'package:hotel_booking/features/hotels/domain/entities/room_group.dart';

class RoomGroupModel extends RoomGroup {
  RoomGroupModel({
    required super.attributes,
    required super.boarding,
    required super.name,
    required super.detailedDescription,
    required super.groupIdentifier,
    required super.quantity,
  });

  factory RoomGroupModel.fromJson(Map<String, dynamic> json) => RoomGroupModel(
        attributes: List<OverallAttributeModel>.from(json["attributes"].map((x) => OverallAttributeModel.fromJson(x))),
        boarding: json["boarding"],
        name: json["name"],
        detailedDescription: json["detailed-description"],
        groupIdentifier: json["group-identifier"],
        quantity: json["quantity"],
      );
}
