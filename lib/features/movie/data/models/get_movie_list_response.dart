// To parse this JSON data, do
//
//     final getMovieListResponse = getMovieListResponseFromJson(jsonString);

import 'dart:convert';

import 'package:starwars_movie_app/features/movie/data/models/movie_model.dart';

GetMovieListResponse getMovieListResponseFromJson(String str) =>
    GetMovieListResponse.fromJson(json.decode(str));

String getMovieListResponseToJson(GetMovieListResponse data) =>
    json.encode(data.toJson());

class GetMovieListResponse {
  int? count;
  dynamic next;
  dynamic previous;
  List<MovieModel>? results;

  GetMovieListResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory GetMovieListResponse.fromJson(Map<String, dynamic> json) =>
      GetMovieListResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<MovieModel>.from(
                json["results"]!.map((x) => MovieModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}
