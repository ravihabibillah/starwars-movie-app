part of 'list_movie_bloc.dart';

sealed class ListMovieEvent extends Equatable {
  const ListMovieEvent();

  @override
  List<Object> get props => [];
}

class FetchMovieList extends ListMovieEvent {
  const FetchMovieList();

  @override
  List<Object> get props => [];
}
