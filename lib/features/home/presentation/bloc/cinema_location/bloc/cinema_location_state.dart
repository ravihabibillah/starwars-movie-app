part of 'cinema_location_bloc.dart';

sealed class CinemaLocationState extends Equatable {
  const CinemaLocationState();

  @override
  List<Object> get props => [];
}

final class CinemaLocationInitial extends CinemaLocationState {}

class CinemaLocationLoading extends CinemaLocationState {}

class CinemaLocationError extends CinemaLocationState {
  final String message;

  const CinemaLocationError(this.message);

  @override
  List<Object> get props => [message];
}

class CinemasLoaded extends CinemaLocationState {
  final List<Suggestion> cinemas;

  const CinemasLoaded(this.cinemas);

  @override
  List<Object> get props => [cinemas];
}
