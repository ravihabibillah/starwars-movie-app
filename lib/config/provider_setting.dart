import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:starwars_movie_app/features/home/presentation/bloc/cinema_location/bloc/cinema_location_bloc.dart';
import 'package:starwars_movie_app/features/home/presentation/bloc/user_location/bloc/user_location_bloc.dart';
import 'package:starwars_movie_app/features/movie/presentation/bloc/list_movie/bloc/list_movie_bloc.dart';
import 'package:starwars_movie_app/injection.dart' as inject;

class ProviderSetting {
  static List<SingleChildWidget> mainProvider = [
    BlocProvider(
      create: (_) => inject.locator<ListMovieBloc>(),
    ),
    BlocProvider(
      create: (_) => inject.locator<UserLocationBloc>(),
    ),
    BlocProvider(
      create: (_) => inject.locator<CinemaLocationBloc>(),
    ),
  ];
}
