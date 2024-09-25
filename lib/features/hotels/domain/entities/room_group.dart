import 'package:hotel_booking/features/hotels/domain/entities/overall_attribute.dart';

class RoomGroup {
  List<OverallAttribute> attributes;
  String boarding;
  String name;
  String? detailedDescription;
  String groupIdentifier;
  int quantity;

  RoomGroup({
    required this.attributes,
    required this.boarding,
    required this.name,
    required this.detailedDescription,
    required this.groupIdentifier,
    required this.quantity,
  });
}
