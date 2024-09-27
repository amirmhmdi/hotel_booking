import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel_booking/core/error/failured.dart';
import 'package:hotel_booking/features/hotels/domain/entities/hotels_search.dart';
import 'package:hotel_booking/features/hotels/domain/usecases/add_favorite_hotels_hive.dart';
import 'package:hotel_booking/features/hotels/domain/usecases/fetch_hotels_list_api_usecase.dart';
import 'package:hotel_booking/features/hotels/domain/usecases/get_favorite_hotels_hive.dart';
import 'package:hotel_booking/features/hotels/domain/usecases/remove_favorite_hotels_hive.dart';

part 'hotels_event.dart';
part 'hotels_state.dart';

class HotelsBloc extends Bloc<HotelsEvent, HotelsState> {
  final FetchHotelsListApiUsecase fetchHotelsListApiUsecase;
  final AddFavoriteHotelsHive addFavoriteHotelsHive;
  final GetFavoriteHotelsHive getFavoriteHotelsHive;
  final RemoveFavoriteHotelsHive removeFavoriteHotelsHive;
  late HotelSearch hotelSearch;

  HotelsBloc({
    required this.fetchHotelsListApiUsecase,
    required this.addFavoriteHotelsHive,
    required this.getFavoriteHotelsHive,
    required this.removeFavoriteHotelsHive,
  }) : super(HotelsLoadingState()) {
    on<HotelsEvent>(_onEvent);
  }
  Future<void> _onEvent(HotelsEvent event, Emitter<HotelsState> emit) async {
    if (event is HotelsFetchEvent) return _onEventHotelFetch(event, emit);
  }

  Future<void> _onEventHotelFetch(HotelsFetchEvent event, Emitter<HotelsState> emit) async {
    emit(HotelsLoadingState());
    try {
      Either<Failure, HotelSearch> result = await fetchHotelsListApiUsecase.call();
      result.fold(
        (Failure failure) {
          emit(HotelsFetchFailedState(failureMessage: failure.message));
        },
        (HotelSearch hotelSearchResult) {
          hotelSearch = hotelSearchResult;
          emit(HotelsLoadedState());
        },
      );
    } catch (e) {
      emit(const HotelsFetchFailedState(failureMessage: "SomeThing were wrong! Please Try again Later!"));
    }
  }
}
