part of 'user_location_bloc.dart';

sealed class UserLocationEvent extends Equatable {
  const UserLocationEvent();

  @override
  List<Object> get props => [];
}

class FetchUserLocation extends UserLocationEvent {
  final BuildContext context;

  const FetchUserLocation(this.context);
}
