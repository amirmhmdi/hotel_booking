import 'package:hotel_booking/features/hotels/data/models/hotel_model.dart';
import 'package:hotel_booking/features/hotels/domain/entities/hotel.dart';
import 'package:test/test.dart';

import '../../../assets/hotel_json_1.dart';
import '../../../assets/hotel_json_2.dart';

void main() {
  group('Hotel Objects', () {
    test('Two instances with the same ID should be equal', () {
      final Hotel hotel1 = HotelModel.fromJson(hotelJson1);

      final Hotel hotel2 = HotelModel.fromJson(hotelJson1);

      expect(hotel1, equals(hotel2));
    });

    test('Two instances with different ID should be different', () {
      final Hotel hotel1 = HotelModel.fromJson(hotelJson1);

      final Hotel hotel2 = HotelModel.fromJson(hotelJson2);

      expect(hotel1, isNot(equals(hotel2)));
    });
  });
}
