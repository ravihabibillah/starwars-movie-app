import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapbox_search/mapbox_search.dart';
import 'package:provider/provider.dart';
import 'package:starwars_movie_app/features/home/presentation/bloc/cinema_location/bloc/cinema_location_bloc.dart';
import 'package:starwars_movie_app/features/home/presentation/bloc/user_location/bloc/user_location_bloc.dart';
import 'package:starwars_movie_app/features/movie/presentation/bloc/list_movie/bloc/list_movie_bloc.dart';
import 'package:starwars_movie_app/features/movie/presentation/widgets/movie_list_vertical.dart';
import 'package:starwars_movie_app/shared_widgets/empty_list_text.dart';
import 'package:starwars_movie_app/shared_widgets/error_list.dart';
import 'package:starwars_movie_app/shared_widgets/loading_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // Memanggil FetchMovieList
    Future.microtask(
        () => context.read<ListMovieBloc>().add(const FetchMovieList()));

    // Memanggil FetchUserLocation untuk mendapatkan lokasi pengguna
    Future.microtask(
        () => context.read<UserLocationBloc>().add(FetchUserLocation(context)));

    super.initState();
  }

  Suggestion? findCinema;
  dynamic cinemaCoordinates;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Star War Movie App'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<ListMovieBloc>().add(const FetchMovieList());
        },
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: BlocBuilder<UserLocationBloc, UserLocationState>(
                  builder: (context, state) {
                    if (state is UserLocationLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is UserLocationLoaded) {
                      Future.microtask(() => context
                          .read<CinemaLocationBloc>()
                          .add(SearchCinemasNearby(state.userPosition)));

                      return BlocBuilder<CinemaLocationBloc,
                          CinemaLocationState>(
                        builder: (context, state) {
                          if (state is CinemaLocationLoading) {
                            return const CircularProgressIndicator();
                          } else if (state is CinemasLoaded) {
                            findCinema = state.cinemas.first;
                            return DropdownSearch<Suggestion>(
                              selectedItem: findCinema,
                              itemAsString: (item) => item.name,
                              items: state.cinemas,
                              onChanged: (value) async {
                                setState(() {
                                  findCinema = value;
                                });
                              },
                            );
                          } else if (state is CinemaLocationError) {
                            return Text(state.message);
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      );
                    } else if (state is UserLocationError) {
                      return Center(
                        child: Text(state.message),
                      );
                    } else {
                      return Center();
                    }
                  },
                )),
            Expanded(
              child: BlocBuilder<ListMovieBloc, ListMovieState>(
                builder: (context, state) {
                  if (state is ListMovieEmpty) {
                    return EmptyListText(text: state.message);
                  } else if (state is ListMovieLoading) {
                    return const LoadingList();
                  } else if (state is ListMovieHasData) {
                    return MovieListVertical(movies: state.result);
                  } else if (state is ListMovieError) {
                    return ErrorList(message: state.message);
                  } else {
                    return const Center();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
