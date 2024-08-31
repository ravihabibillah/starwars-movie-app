part of 'cinema_location_bloc.dart';

sealed class CinemaLocationEvent extends Equatable {
  const CinemaLocationEvent();

  @override
  List<Object> get props => [];
}

class SearchCinemasNearby extends CinemaLocationEvent {
  final Position userPosition;

  const SearchCinemasNearby(this.userPosition);
}
