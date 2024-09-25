import 'package:hotel_booking/features/hotels/domain/entities/enum_values.dart';

class Analytics {
  SelectItemItem0 selectItemItem0;

  Analytics({
    required this.selectItemItem0,
  });
}

class SelectItemItem0 {
  Currency currency;
  String itemCategory;
  String itemCategory2;
  String itemId;
  ItemListName itemListName;
  String itemName;
  String itemRooms;
  String price;
  String quantity;

  SelectItemItem0({
    required this.currency,
    required this.itemCategory,
    required this.itemCategory2,
    required this.itemId,
    required this.itemListName,
    required this.itemName,
    required this.itemRooms,
    required this.price,
    required this.quantity,
  });
}

enum Currency { EUR }

final currencyValues = EnumValues({"EUR": Currency.EUR});

enum ItemListName { HOTEL_LIST_RECOMMENDATION }

final itemListNameValues = EnumValues({"hotel list - recommendation": ItemListName.HOTEL_LIST_RECOMMENDATION});
