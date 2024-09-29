import 'package:hotel_booking/features/hotels/data/models/overall_attribute_model.dart';
import 'package:hotel_booking/features/hotels/domain/entities/room_group.dart';

class RoomGroupModel extends RoomGroup {
  final List<OverallAttributeModel> attributesModel;
  RoomGroupModel({
    required this.attributesModel,
    required super.boarding,
    required super.name,
    required super.detailedDescription,
    required super.groupIdentifier,
    required super.quantity,
  }) : super(attributes: attributesModel);

  factory RoomGroupModel.fromDomain(RoomGroup roomGroup) => RoomGroupModel(
        attributesModel: List<OverallAttributeModel>.from(roomGroup.attributes.map((x) => OverallAttributeModel.fromDomain(x))),
        boarding: roomGroup.boarding,
        name: roomGroup.name,
        detailedDescription: roomGroup.detailedDescription,
        groupIdentifier: roomGroup.groupIdentifier,
        quantity: roomGroup.quantity,
      );

  factory RoomGroupModel.fromJson(Map<String, dynamic> json) => RoomGroupModel(
        attributesModel: List<OverallAttributeModel>.from(json["attributes"].map((x) => OverallAttributeModel.fromJson(x))),
        boarding: json["boarding"],
        name: json["name"],
        detailedDescription: json["detailed-description"],
        groupIdentifier: json["group-identifier"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "attributes": List<dynamic>.from(attributesModel.map((x) => x.toJson())),
        "boarding": boarding,
        "name": name,
        "detailed-description": detailedDescription,
        "group-identifier": groupIdentifier,
        "quantity": quantity,
      };
}
