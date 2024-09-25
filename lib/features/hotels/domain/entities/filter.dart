import 'package:hotel_booking/features/hotels/domain/entities/enum_values.dart';

class Filter {
  List<FilterAttribute>? attributes;
  String category;
  bool inUse;
  Type type;
  Range? range;

  Filter({
    this.attributes,
    required this.category,
    required this.inUse,
    required this.type,
    this.range,
  });
}

class FilterAttribute {
  String attributeIdentifier;
  String attributeValue;
  bool inUse;
  bool isDisabled;
  bool isPopular;
  int minPrice;
  int resultCount;

  FilterAttribute({
    required this.attributeIdentifier,
    required this.attributeValue,
    required this.inUse,
    required this.isDisabled,
    required this.isPopular,
    required this.minPrice,
    required this.resultCount,
  });
}

class Range {
  String max;
  String min;
  String type;
  String selectedMaxValue;
  String selectedMinValue;

  Range({
    required this.max,
    required this.min,
    required this.type,
    required this.selectedMaxValue,
    required this.selectedMinValue,
  });
}

enum Type { CHECKBOX, RADIO, RANGE }

final typeValues = EnumValues({"checkbox": Type.CHECKBOX, "radio": Type.RADIO, "range": Type.RANGE});
