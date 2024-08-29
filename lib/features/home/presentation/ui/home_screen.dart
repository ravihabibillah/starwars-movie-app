import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:starwars_movie_app/features/movie/presentation/bloc/list_movie/bloc/list_movie_bloc.dart';
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
    Future.microtask(() => Provider.of<ListMovieBloc>(context, listen: false)
        .add(const FetchMovieList()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Star War Movie App'),
      ),
      body: Column(
        children: [
          BlocBuilder<ListMovieBloc, ListMovieState>(
            builder: (context, state) {
              if (state is ListMovieEmpty) {
                return EmptyListText(text: state.message);
              } else if (state is ListMovieLoading) {
                return const LoadingList();
              } else if (state is ListMovieHasData) {
                var movies = state.result;
                return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      var movie = movies[index];
                      return ListTile(
                        onTap: () {},
                        title: Text(movie.title ?? 'Tidak ada Judul'),
                      );
                    },
                    separatorBuilder: (_, index) {
                      return const SizedBox(height: 8);
                    },
                    itemCount: movies.length);
              } else if (state is ListMovieError) {
                return ErrorList(message: state.message);
              } else {
                return const Center();
              }
            },
          ),
        ],
      ),
    );
  }
}
