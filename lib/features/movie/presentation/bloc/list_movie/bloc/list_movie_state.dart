part of 'list_movie_bloc.dart';

sealed class ListMovieState extends Equatable {
  const ListMovieState();

  @override
  List<Object> get props => [];
}

final class ListMovieEmpty extends ListMovieState {
  final String message;

  const ListMovieEmpty(this.message);

  @override
  List<Object> get props => [message];
}

class ListMovieLoading extends ListMovieState {}

class ListMovieError extends ListMovieState {
  final String message;

  const ListMovieError(this.message);

  @override
  List<Object> get props => [message];
}

class ListMovieHasData extends ListMovieState {
  final List<Movie> result;

  const ListMovieHasData(this.result);

  @override
  List<Object> get props => [result];
}
