import 'package:hotel_booking/features/hotels/domain/entities/analytics.dart';

class AnalyticsModel extends Analytics {
  AnalyticsModel({
    required super.selectItemItem0,
  });

  factory AnalyticsModel.fromJson(Map<String, dynamic> json) => AnalyticsModel(
        selectItemItem0: SelectItemItem0Model.fromJson(json["select_item.item.0"]),
      );
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
}
