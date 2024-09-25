import 'package:hotel_booking/features/hotels/domain/entities/room.dart';

class RoomModel extends Room {
  RoomModel({
    required super.adultCount,
    required super.childrenAges,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
        adultCount: json["adult-count"],
        childrenAges: List<dynamic>.from(json["children-ages"].map((x) => x)),
      );
}
