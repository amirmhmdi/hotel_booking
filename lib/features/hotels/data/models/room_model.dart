import 'package:hotel_booking/features/hotels/domain/entities/room.dart';

class RoomModel extends Room {
  RoomModel({
    required super.adultCount,
    required super.childrenAges,
  });

  factory RoomModel.fromDomain(Room room) => RoomModel(
        adultCount: room.adultCount,
        childrenAges: room.childrenAges,
      );

  factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
        adultCount: json["adult-count"],
        childrenAges: List<dynamic>.from(json["children-ages"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "adult-count": adultCount,
        "children-ages": List<dynamic>.from(childrenAges.map((x) => x)),
      };
}
