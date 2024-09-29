import 'package:dartz/dartz.dart';
import 'package:hotel_booking/core/error/failured.dart';
import 'package:hotel_booking/features/hotels/domain/entities/hotel.dart';
import 'package:hotel_booking/features/hotels/domain/entities/hotels_search.dart';

abstract class HotelRepository {
  Future<Either<Failure, HotelSearch>> fetchHotelsListApi();

  Either<Failure, List<Hotel>> getFavariteHotelsHive();

  Either<Failure, bool> addFavariteHotelsHive(Hotel hotel);

  Either<Failure, bool> removeFavariteHotelsHive(Hotel hotel);

  Either<Failure, bool> checkIsFavaritedHotelsHive(Hotel hotel);
}
