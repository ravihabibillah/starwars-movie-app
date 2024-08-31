import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_search/mapbox_search.dart';
import 'package:mapbox_search/models/location.dart' as location;

part 'cinema_location_event.dart';
part 'cinema_location_state.dart';

class CinemaLocationBloc
    extends Bloc<CinemaLocationEvent, CinemaLocationState> {
  CinemaLocationBloc() : super(CinemaLocationInitial()) {
    on<SearchCinemasNearby>((event, emit) async {
      try {
        final search = SearchBoxAPI(
            // country: 'ID',
            );
        final searchPlace = await search.getSuggestions(
          'cinema',
          poi: [POICategory.cinema],
          proximity: location.Proximity.LatLong(
            lat: event.userPosition.latitude,
            long: event.userPosition.longitude,
          ),
        );

        if (searchPlace.success != null &&
            searchPlace.success!.suggestions.isNotEmpty) {
          var filteredCinema = searchPlace.success!.suggestions.where((item) {
            return item.featureType != 'category';
          }).toList();

          emit(CinemasLoaded(filteredCinema));
        } else {
          emit(const CinemaLocationError('No cinemas found nearby.'));
        }
      } catch (e) {
        emit(const CinemaLocationError('Failed to search cinemas.'));
      }
    });
  }
}
