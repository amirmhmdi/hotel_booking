import 'package:hotel_booking/features/hotels/domain/entities/overall_attribute.dart';

class Overall {
  List<OverallAttribute> attributes;
  String boarding;
  String name;
  int adultCount;
  List<dynamic> childrenAges;
  int childrenCount;
  int quantity;
  bool sameBoarding;
  bool sameRoomGroups;

  Overall({
    required this.attributes,
    required this.boarding,
    required this.name,
    required this.adultCount,
    required this.childrenAges,
    required this.childrenCount,
    required this.quantity,
    required this.sameBoarding,
    required this.sameRoomGroups,
  });
}
