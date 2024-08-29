import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:starwars_movie_app/features/movie/data/datasources/movie_remote_data_source.dart';
import 'package:starwars_movie_app/features/movie/domain/entities/movie.dart';
import 'package:starwars_movie_app/features/movie/domain/repositories/movie_repository.dart';
import 'package:starwars_movie_app/utils/exception.dart';
import 'package:starwars_movie_app/utils/failure.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Movie>>> getMovieList() async {
    try {
      final result = await remoteDataSource.getMovieList();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure('Terjadi Kesalahan Server'));
    } on SocketException {
      return const Left(ConnectionFailure('Gagal Menyambungkan ke Internet'));
    }
  }
}
