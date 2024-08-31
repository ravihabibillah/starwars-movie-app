import 'package:flutter/material.dart';
import 'package:starwars_movie_app/config/themes/app_textstyle.dart';
import 'package:starwars_movie_app/features/movie/domain/entities/movie.dart';
import 'package:starwars_movie_app/utils/convert_date.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: movie.title ?? 'No Title',
                  children: [
                    TextSpan(
                        text: movie.releaseDate != null
                            ? ' (${ConvertDate.convertYear(movie.releaseDate)})'
                            : '')
                  ],
                ),
                style: AppTextstyle.titleTextStyle,
              ),
              movie.releaseDate != null
                  ? Text(
                      ConvertDate.convertDate(movie.releaseDate),
                    )
                  : const Center(),
              const SizedBox(height: 16),
              Text('Episode Total : ${movie.episodeId}'),
              Text('Director : ${movie.director}'),
              Text('Producer : ${movie.producer}'),
              const SizedBox(height: 16),
              const Text(
                'Synopsis',
                style: AppTextstyle.subtitleTextStyle,
              ),
              Text(movie.openingCrawl ?? 'No Synopsis')
            ],
          ),
        ),
      ),
    );
  }
}
