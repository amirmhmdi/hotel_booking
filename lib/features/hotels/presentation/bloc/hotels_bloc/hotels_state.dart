part of 'hotels_bloc.dart';

sealed class HotelsState extends Equatable {
  const HotelsState();

  @override
  List<Object> get props => [];
}

final class HotelsLoadingState extends HotelsState {
  @override
  List<Object> get props => [];
}

final class HotelsLoadedState extends HotelsState {
  final HotelSearch hotelSearch;

  const HotelsLoadedState({required this.hotelSearch});
  @override
  List<Object> get props => [];
}

final class HotelsFetchFailedState extends HotelsState {
  final String failureMessage;

  const HotelsFetchFailedState({required this.failureMessage});

  @override
  List<Object> get props => [];
}
