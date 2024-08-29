import 'package:get_it/get_it.dart';
import 'package:starwars_movie_app/features/movie/data/datasources/movie_remote_data_source.dart';
import 'package:starwars_movie_app/features/movie/data/repositories/movie_repository_impl.dart';
import 'package:starwars_movie_app/features/movie/domain/repositories/movie_repository.dart';
import 'package:starwars_movie_app/features/movie/domain/usecases/get_movie_list.dart';
import 'package:starwars_movie_app/features/movie/presentation/bloc/list_movie/bloc/list_movie_bloc.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  // BLoC
  locator.registerFactory(
    () => ListMovieBloc(
      getMovieList: locator(),
    ),
  );

  // Repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(remoteDataSource: locator()),
  );

  // Use Case
  locator.registerLazySingleton(() => GetMovieList(locator()));

  // Data Source
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));

  // External (HTTP)
  locator.registerLazySingleton(() => http.Client());
}
