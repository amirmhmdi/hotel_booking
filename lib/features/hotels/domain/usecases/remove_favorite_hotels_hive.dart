import 'package:dartz/dartz.dart';
import 'package:hotel_booking/core/error/failured.dart';
import 'package:hotel_booking/features/hotels/domain/entities/hotel.dart';
import 'package:hotel_booking/features/hotels/domain/repositories/hotel_repository.dart';

class RemoveFavoriteHotelsHive {
  final HotelRepository repository;
  RemoveFavoriteHotelsHive({required this.repository});

  Either<Failure, bool> call(Hotel hotel) {
    return repository.removeFavariteHotelsHive(hotel);
  }
}
