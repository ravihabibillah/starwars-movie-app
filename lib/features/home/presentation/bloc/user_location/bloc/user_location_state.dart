part of 'user_location_bloc.dart';

sealed class UserLocationState extends Equatable {
  const UserLocationState();

  @override
  List<Object> get props => [];
}

final class UserLocationEmpty extends UserLocationState {
  final String message;

  const UserLocationEmpty(this.message);

  @override
  List<Object> get props => [message];
}

class UserLocationLoading extends UserLocationState {}

class UserLocationLoaded extends UserLocationState {
  final Position userPosition;

  const UserLocationLoaded(this.userPosition);

  @override
  List<Object> get props => [userPosition];
}

class UserLocationError extends UserLocationState {
  final String message;

  const UserLocationError(this.message);

  @override
  List<Object> get props => [message];
}
