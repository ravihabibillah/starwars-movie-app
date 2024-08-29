import 'package:dartz/dartz.dart';
import 'package:starwars_movie_app/features/movie/domain/entities/movie.dart';
import 'package:starwars_movie_app/utils/failure.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getMovieList();
}
