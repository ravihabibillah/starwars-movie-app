import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  String? title;
  int? episodeId;
  String? openingCrawl;
  String? director;
  String? producer;
  DateTime? releaseDate;
  List<String>? characters;
  List<String>? planets;
  List<String>? starships;
  List<String>? vehicles;
  List<String>? species;
  DateTime? created;
  DateTime? edited;
  String? url;

  Movie({
    required this.title,
    required this.episodeId,
    required this.openingCrawl,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.characters,
    required this.planets,
    required this.starships,
    required this.vehicles,
    required this.species,
    required this.created,
    required this.edited,
    required this.url,
  });

  @override
  List<Object?> get props => [
        title,
        episodeId,
        openingCrawl,
        director,
        producer,
        releaseDate,
        characters,
        planets,
        starships,
        vehicles,
        species,
        created,
        edited,
        url,
      ];
}
