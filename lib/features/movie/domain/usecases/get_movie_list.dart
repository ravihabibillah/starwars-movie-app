import 'package:dartz/dartz.dart';
import 'package:starwars_movie_app/features/movie/domain/entities/movie.dart';
import 'package:starwars_movie_app/features/movie/domain/repositories/movie_repository.dart';
import 'package:starwars_movie_app/utils/failure.dart';

class GetMovieList {
  final MovieRepository repository;

  GetMovieList(this.repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getMovieList();
  }
}
