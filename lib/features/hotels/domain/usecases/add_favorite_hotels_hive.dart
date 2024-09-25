import 'package:dartz/dartz.dart';
import 'package:hotel_booking/core/error/failured.dart';
import 'package:hotel_booking/features/hotels/domain/repositories/hotel_repository.dart';

class AddFavoriteHotelsHive {
  final HotelRepository repository;
  AddFavoriteHotelsHive({required this.repository});

  Either<Failure, bool> call() {
    return repository.addFavariteHotelsHive();
  }
}
