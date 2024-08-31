import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:starwars_movie_app/utils/locator_service.dart';

part 'user_location_event.dart';
part 'user_location_state.dart';

class UserLocationBloc extends Bloc<UserLocationEvent, UserLocationState> {
  UserLocationBloc()
      : super(UserLocationEmpty('The user location has not been found')) {
    on<FetchUserLocation>(
      (event, emit) async {
        emit(UserLocationLoading());
        try {
          var userPosition =
              await LocatorService().getCurrentPosition(event.context);
          if (userPosition != null) {
            emit(UserLocationLoaded(userPosition));
          } else {
            emit(const UserLocationError('The user location not found'));
          }
        } catch (e) {
          emit(const UserLocationError('Failed to fetch user location.'));
        }
      },
    );
  }
}
