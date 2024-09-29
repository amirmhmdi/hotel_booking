import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking/core/error/failured.dart';
import 'package:hotel_booking/features/hotels/data/models/hotel_model.dart';
import 'package:hotel_booking/features/hotels/domain/entities/hotel.dart';
import 'package:hotel_booking/features/hotels/domain/repositories/hotel_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements HotelRepository {}

void main() {
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
  });

  test("Fetch Favorite Hotels List DB", () async {
    List<Hotel> hotelsList = [];
    when(() => mockRepository.getFavariteHotelsHive()).thenAnswer((_) => Right(hotelsList));
    Either<Failure, List<Hotel>> result = mockRepository.getFavariteHotelsHive();
    expect(result, Right(hotelsList));
  });
}
