import 'package:hotel_booking/features/hotels/data/models/overall_attribute_model.dart';
import 'package:hotel_booking/features/hotels/domain/entities/overall.dart';

class OverallModel extends Overall {
  final List<OverallAttributeModel> attributesModel;
  OverallModel({
    required this.attributesModel,
    required super.boarding,
    required super.name,
    required super.adultCount,
    required super.childrenAges,
    required super.childrenCount,
    required super.quantity,
    required super.sameBoarding,
    required super.sameRoomGroups,
  }) : super(attributes: attributesModel);

  factory OverallModel.fromDomain(Overall overall) => OverallModel(
        attributesModel: List<OverallAttributeModel>.from(overall.attributes.map((x) => OverallAttributeModel.fromDomain(x))),
        boarding: overall.boarding,
        name: overall.name,
        adultCount: overall.adultCount,
        childrenAges: overall.childrenAges,
        childrenCount: overall.childrenCount,
        quantity: overall.quantity,
        sameBoarding: overall.sameBoarding,
        sameRoomGroups: overall.sameRoomGroups,
      );

  factory OverallModel.fromJson(Map<String, dynamic> json) => OverallModel(
        attributesModel: List<OverallAttributeModel>.from(json["attributes"].map((x) => OverallAttributeModel.fromJson(x))),
        boarding: json["boarding"],
        name: json["name"],
        adultCount: json["adult-count"],
        childrenAges: List<dynamic>.from(json["children-ages"].map((x) => x)),
        childrenCount: json["children-count"],
        quantity: json["quantity"],
        sameBoarding: json["same-boarding"],
        sameRoomGroups: json["same-room-groups"],
      );

  Map<String, dynamic> toJson() => {
        "attributes": List<dynamic>.from(attributesModel.map((x) => x.toJson())),
        "boarding": boarding,
        "name": name,
        "adult-count": adultCount,
        "children-ages": List<dynamic>.from(childrenAges.map((x) => x)),
        "children-count": childrenCount,
        "quantity": quantity,
        "same-boarding": sameBoarding,
        "same-room-groups": sameRoomGroups,
      };
}
