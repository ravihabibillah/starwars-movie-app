import 'package:flutter/material.dart';
import 'package:starwars_movie_app/features/movie/domain/entities/movie.dart';
import 'package:starwars_movie_app/features/movie/presentation/widgets/movie_list_item.dart';

class MovieListVertical extends StatelessWidget {
  const MovieListVertical({super.key, required this.movies});

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_, index) {
        var movie = movies[index];
        return MovieListItem(
          title: movie.title ?? 'Tidak ada Judul',
        );
      },
      separatorBuilder: (_, index) {
        return const SizedBox(height: 8);
      },
      itemCount: movies.length,
    );
  }
}
