import 'package:hotel_booking/features/hotels/domain/entities/enum_values.dart';

class OverallAttribute {
  Id id;
  Name name;
  dynamic value;
  bool isUnique;

  OverallAttribute({
    required this.id,
    required this.name,
    required this.value,
    required this.isUnique,
  });
}

enum Id { IT05_BT_BA, IT05_BT_BT }

final idValues = EnumValues({"IT05-BT#BA": Id.IT05_BT_BA, "IT05-BT#BT": Id.IT05_BT_BT});

enum Name { BALKON, BALKON_TERRASSE }

final nameValues = EnumValues({"Balkon": Name.BALKON, "Balkon/Terrasse": Name.BALKON_TERRASSE});
