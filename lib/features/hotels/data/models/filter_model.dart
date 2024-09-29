import 'package:hotel_booking/features/hotels/domain/entities/filter.dart';

class FilterModel extends Filter {
  final RangeModel? rangeModel;
  final List<FilterAttributeModel>? attributesModel;
  FilterModel({
    this.attributesModel,
    required super.category,
    required super.inUse,
    required super.type,
    this.rangeModel,
  }) : super(attributes: attributesModel, range: rangeModel);

  factory FilterModel.fromDomain(Filter filter) => FilterModel(
        category: filter.category,
        inUse: filter.inUse,
        type: filter.type,
      );

  factory FilterModel.fromJson(Map<String, dynamic> json) => FilterModel(
        attributesModel: json["attributes"] == null ? [] : List<FilterAttributeModel>.from(json["attributes"]!.map((x) => FilterAttributeModel.fromJson(x))),
        category: json["category"],
        inUse: json["in-use"],
        type: typeValues.map[json["type"]]!,
        rangeModel: json["range"] == null ? null : RangeModel.fromJson(json["range"]),
      );

  Map<String, dynamic> toJson() => {
        "attributes": attributesModel == null ? [] : List<dynamic>.from(attributesModel!.map((x) => x.toJson())),
        "category": category,
        "in-use": inUse,
        "type": typeValues.reverse[type],
        "range": rangeModel?.toJson(),
      };
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

  factory FilterAttributeModel.fromDomain(FilterAttribute filterAttribute) => FilterAttributeModel(
        attributeIdentifier: filterAttribute.attributeIdentifier,
        attributeValue: filterAttribute.attributeValue,
        inUse: filterAttribute.inUse,
        isDisabled: filterAttribute.isDisabled,
        isPopular: filterAttribute.isPopular,
        minPrice: filterAttribute.minPrice,
        resultCount: filterAttribute.resultCount,
      );

  factory FilterAttributeModel.fromJson(Map<String, dynamic> json) => FilterAttributeModel(
        attributeIdentifier: json["attribute-identifier"],
        attributeValue: json["attribute-value"],
        inUse: json["in-use"],
        isDisabled: json["is-disabled"],
        isPopular: json["is-popular"],
        minPrice: json["min-price"],
        resultCount: json["result-count"],
      );

  Map<String, dynamic> toJson() => {
        "attribute-identifier": attributeIdentifier,
        "attribute-value": attributeValue,
        "in-use": inUse,
        "is-disabled": isDisabled,
        "is-popular": isPopular,
        "min-price": minPrice,
        "result-count": resultCount,
      };
}

class RangeModel extends Range {
  RangeModel({
    required super.max,
    required super.min,
    required super.type,
    required super.selectedMaxValue,
    required super.selectedMinValue,
  });

  factory RangeModel.fromDomain(Range range) => RangeModel(
        max: range.max,
        min: range.min,
        type: range.type,
        selectedMaxValue: range.selectedMaxValue,
        selectedMinValue: range.selectedMinValue,
      );

  factory RangeModel.fromJson(Map<String, dynamic> json) => RangeModel(
        max: json["max"],
        min: json["min"],
        type: json["type"],
        selectedMaxValue: json["selected-max-value"],
        selectedMinValue: json["selected-min-value"],
      );

  Map<String, dynamic> toJson() => {
        "max": max,
        "min": min,
        "type": type,
        "selected-max-value": selectedMaxValue,
        "selected-min-value": selectedMinValue,
      };
}
