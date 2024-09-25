import 'package:hotel_booking/features/hotels/domain/entities/filter.dart';

class FilterModel extends Filter {
  FilterModel({
    super.attributes,
    required super.category,
    required super.inUse,
    required super.type,
    super.range,
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) => FilterModel(
        attributes: json["attributes"] == null ? [] : List<FilterAttributeModel>.from(json["attributes"]!.map((x) => FilterAttributeModel.fromJson(x))),
        category: json["category"],
        inUse: json["in-use"],
        type: typeValues.map[json["type"]]!,
        range: json["range"] == null ? null : RangeModel.fromJson(json["range"]),
      );
}

class FilterAttributeModel extends FilterAttribute {

  FilterAttributeModel({
    required super.attributeIdentifier,
    required super.attributeValue,
    required super.inUse,
    required super.isDisabled,
    required super.isPopular,
    required super.minPrice,
    required super.resultCount,
  });

  factory FilterAttributeModel.fromJson(Map<String, dynamic> json) => FilterAttributeModel(
        attributeIdentifier: json["attribute-identifier"],
        attributeValue: json["attribute-value"],
        inUse: json["in-use"],
        isDisabled: json["is-disabled"],
        isPopular: json["is-popular"],
        minPrice: json["min-price"],
        resultCount: json["result-count"],
      );
}

class RangeModel extends Range{

  RangeModel({
    required super.max,
    required super.min,
    required super.type,
    required super.selectedMaxValue,
    required super.selectedMinValue,
  });

  factory RangeModel.fromJson(Map<String, dynamic> json) => RangeModel(
        max: json["max"],
        min: json["min"],
        type: json["type"],
        selectedMaxValue: json["selected-max-value"],
        selectedMinValue: json["selected-min-value"],
      );
}
