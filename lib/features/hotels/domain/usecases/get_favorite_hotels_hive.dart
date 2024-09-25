import 'package:dartz/dartz.dart';
import 'package:hotel_booking/core/error/failured.dart';
import 'package:hotel_booking/features/hotels/domain/entities/hotel.dart';
import 'package:hotel_booking/features/hotels/domain/repositories/hotel_repository.dart';

class GetFavoriteHotelsHive {
  final HotelRepository repository;
  GetFavoriteHotelsHive({required this.repository});

  Either<Failure, List<Hotel>> call() {
    return repository.getFavariteHotelsHive();
  }
}
