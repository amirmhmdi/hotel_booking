import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking/features/hotels/data/datasources/hotel_datasource_interface.dart';
import 'package:hotel_booking/features/hotels/data/models/hotel_model.dart';
import 'package:hotel_booking/features/hotels/data/models/hotels_search_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

import '../../../assets/hotel_search_josn.dart';

class MockRepository extends Mock implements HotelDatasourceInterface {}

class MockReponse extends Mock implements http.Response {}

void main() {
  late MockRepository mockRepository;
  late MockReponse mockReponse;

  setUp(() {
    mockRepository = MockRepository();
    mockReponse = MockReponse();
  });

  test("Fetch Hotels List Api 200 ", () async {
    when(() => mockReponse.statusCode).thenAnswer((_) => 200);
    when(() => mockReponse.body).thenAnswer((_) => jsonEncode(hotelSearchJson));
    when(() => mockRepository.fetchHotelsListApi()).thenAnswer((_) async => mockReponse);

    http.Response response = await mockRepository.fetchHotelsListApi();
    HotelSearchModel hotelSearchModel = HotelSearchModel.fromJson(jsonDecode(response.body));

    expect(hotelSearchModel, isA<HotelSearchModel>());
  });

  test("Fetch Favorite Hotels List DB", () async {
    when(() => mockRepository.getFavariteHotelsHive()).thenAnswer((_) => <HotelModel>[]);
    List<HotelModel> hotelsList = mockRepository.getFavariteHotelsHive();
    
  });
}
