// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart' as http;
import 'package:starwars_movie_app/features/movie/data/models/get_movie_list_response.dart';
import 'package:starwars_movie_app/features/movie/data/models/movie_model.dart';
import 'package:starwars_movie_app/utils/exception.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getMovieList();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final String BASE_URL = 'https://swapi.dev/api';
  final String MOVIE_ENDPOINT = '/films';

  var HEADER = {
    'Accept': 'application/json',
  };

  final http.Client client;

  MovieRemoteDataSourceImpl({required this.client});

  @override
  Future<List<MovieModel>> getMovieList() async {
    final response = await client.get(
      Uri.parse('$BASE_URL$MOVIE_ENDPOINT'),
      headers: HEADER,
    );

    if (response.statusCode == 200) {
      return getMovieListResponseFromJson(response.body).results!;
    } else {
      throw ServerException();
    }
  }
}
