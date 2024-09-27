part of 'hotels_bloc.dart';

sealed class HotelsEvent extends Equatable {
  const HotelsEvent();

  @override
  List<Object> get props => [];
}

final class HotelsFetchEvent extends HotelsEvent {
  @override
  List<Object> get props => [];
}
