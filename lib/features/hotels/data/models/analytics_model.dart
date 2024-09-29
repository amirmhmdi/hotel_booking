import 'package:hotel_booking/features/hotels/domain/entities/analytics.dart';

class AnalyticsModel extends Analytics {
  final SelectItemItem0Model selectItemItem0Model;
  AnalyticsModel({
    required this.selectItemItem0Model,
  }) : super(selectItemItem0: selectItemItem0Model);

  factory AnalyticsModel.fromDomain(Analytics analytics) => AnalyticsModel(
        selectItemItem0Model: SelectItemItem0Model.fromDomain(analytics.selectItemItem0),
      );

  factory AnalyticsModel.fromJson(Map<String, dynamic> json) => AnalyticsModel(
        selectItemItem0Model: SelectItemItem0Model.fromJson(json["select_item.item.0"]),
      );

  Map<String, dynamic> toJson() => {
        "select_item.item.0": selectItemItem0Model.toJson(),
      };
}

class SelectItemItem0Model extends SelectItemItem0 {
  SelectItemItem0Model({
    required super.currency,
    required super.itemCategory,
    required super.itemCategory2,
    required super.itemId,
    required super.itemListName,
    required super.itemName,
    required super.itemRooms,
    required super.price,
    required super.quantity,
  });

  factory SelectItemItem0Model.fromDomain(SelectItemItem0 selectItemItem0) => SelectItemItem0Model(
        currency: selectItemItem0.currency,
        itemCategory: selectItemItem0.itemCategory,
        itemCategory2: selectItemItem0.itemCategory2,
        itemId: selectItemItem0.itemId,
        itemListName: selectItemItem0.itemListName,
        itemName: selectItemItem0.itemName,
        itemRooms: selectItemItem0.itemRooms,
        price: selectItemItem0.price,
        quantity: selectItemItem0.quantity,
      );

  factory SelectItemItem0Model.fromJson(Map<String, dynamic> json) => SelectItemItem0Model(
        currency: currencyValues.map[json["currency"]]!,
        itemCategory: json["itemCategory"],
        itemCategory2: json["itemCategory2"],
        itemId: json["itemId"],
        itemListName: itemListNameValues.map[json["itemListName"]]!,
        itemName: json["itemName"],
        itemRooms: json["itemRooms"],
        price: json["price"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currencyValues.reverse[currency],
        "itemCategory": itemCategory,
        "itemCategory2": itemCategory2,
        "itemId": itemId,
        "itemListName": itemListNameValues.reverse[itemListName],
        "itemName": itemName,
        "itemRooms": itemRooms,
        "price": price,
        "quantity": quantity,
      };
}
