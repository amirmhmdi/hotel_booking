import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel_booking/core/error/failured.dart';
import 'package:hotel_booking/features/hotels/domain/entities/hotel.dart';
import 'package:hotel_booking/features/hotels/domain/entities/hotels_search.dart';
import 'package:hotel_booking/features/hotels/domain/usecases/add_favorite_hotels_hive.dart';
import 'package:hotel_booking/features/hotels/domain/usecases/check_is_favorited_hotel_hive.dart';
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
  final CheckIsFavoritedHotelHive checkIsFavoritedHotelHive;
  late HotelSearch _hotelSearch;
  List<Hotel> favoriteList = [];

  HotelsBloc({
    required this.fetchHotelsListApiUsecase,
    required this.addFavoriteHotelsHive,
    required this.getFavoriteHotelsHive,
    required this.removeFavoriteHotelsHive,
    required this.checkIsFavoritedHotelHive,
  }) : super(HotelsLoadingState()) {
    on<HotelsEvent>(_onEvent);
  }
  Future<void> _onEvent(HotelsEvent event, Emitter<HotelsState> emit) async {
    if (event is HotelsFetchEvent) return _onEventHotelFetch(event, emit);
    if (event is CheckIsFavoritedEvent) return _onEventCheckIsFavorited(event, emit);
    if (event is AddFavoriteEvent) return _onEventAddFavoriteFetch(event, emit);
    if (event is RemoveFavoriteEvent) return _onEventRemoveFavoriteFetch(event, emit);
    if (event is GetFavoritesEvent) return _onEventGetFavoriteListFetch(event, emit);
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
          _hotelSearch = hotelSearchResult;
          emit(HotelsLoadedState(hotelSearch: hotelSearchResult));
        },
      );
    } catch (e) {
      emit(const HotelsFetchFailedState(failureMessage: "SomeThing were wrong! Please Try again Later!"));
    }
  }

  Future<void> _onEventCheckIsFavorited(CheckIsFavoritedEvent event, Emitter<HotelsState> emit) async {
    print("_onEventCheckIsFavorited : ${event.hotel.name}");
    try {
      Either<Failure, bool> result = checkIsFavoritedHotelHive.call(event.hotel);
      result.fold(
        (Failure failure) {
          //do nothing
        },
        (bool isFavorited) {
          print("_onEventCheckIsFavorited IsFavarite : $isFavorited -> ${event.hotel.name}");
          emit(IsFavoritedHotelState(hotel: event.hotel, isFavorited: isFavorited));
        },
      );
    } catch (e) {
      //No thing
    }
  }

  Future<void> _onEventAddFavoriteFetch(AddFavoriteEvent event, Emitter<HotelsState> emit) async {
    emit(const FavoriteHotelDbProcessState());
    try {
      Either<Failure, bool> result = addFavoriteHotelsHive.call(event.hotel);
      result.fold(
        (Failure failure) {
          emit(FavoriteHotelFailurState(message: failure.message));
        },
        (bool isOkay) {
          emit(FavoriteHotelAddedState(hotel: event.hotel));
          emit(IsFavoritedHotelState(hotel: event.hotel, isFavorited: true));
        },
      );
    } catch (e) {
      emit(const FavoriteHotelFailurState(message: "DataBase need Help! try again later :("));
    }
  }

  Future<void> _onEventRemoveFavoriteFetch(RemoveFavoriteEvent event, Emitter<HotelsState> emit) async {
    emit(const FavoriteHotelDbProcessState());
    try {
      Either<Failure, bool> result = removeFavoriteHotelsHive.call(event.hotel);
      result.fold(
        (Failure failure) {
          emit(FavoriteHotelFailurState(message: failure.message));
        },
        (bool isOkay) {
          emit(FavoriteHotelRemoveState(hotel: event.hotel));
          emit(IsFavoritedHotelState(hotel: event.hotel, isFavorited: false));
        },
      );
    } catch (e) {
      emit(const FavoriteHotelFailurState(message: "DataBase need Help! try again later :("));
    }
  }

  Future<void> _onEventGetFavoriteListFetch(GetFavoritesEvent event, Emitter<HotelsState> emit) async {
    emit(const FavoriteHotelDbProcessState());
    try {
      Either<Failure, List<Hotel>> result = getFavoriteHotelsHive.call();
      result.fold(
        (Failure failure) {
          emit(FavoriteHotelFailurState(message: failure.message));
        },
        (List<Hotel> hotelList) {
          favoriteList = hotelList;
          emit(GetFavoriteHotelsListState(hotelsList: favoriteList));
        },
      );
    } catch (e) {
      emit(const FavoriteHotelFailurState(message: "DataBase need Help! try again later :("));
    }
  }
}
