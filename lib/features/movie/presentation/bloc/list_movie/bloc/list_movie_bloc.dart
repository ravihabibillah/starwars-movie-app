import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:starwars_movie_app/features/movie/domain/entities/movie.dart';
import 'package:starwars_movie_app/features/movie/domain/usecases/get_movie_list.dart';

part 'list_movie_event.dart';
part 'list_movie_state.dart';

class ListMovieBloc extends Bloc<ListMovieEvent, ListMovieState> {
  final GetMovieList getMovieList;

  ListMovieBloc({required this.getMovieList})
      : super(const ListMovieEmpty('Belum ada Film')) {
    on<FetchMovieList>((event, emit) async {
      emit(ListMovieLoading());

      final result = await getMovieList.execute();

      result.fold(
        (failure) => emit(ListMovieError(failure.message)),
        (data) {
          if (data.isEmpty) {
            emit(const ListMovieEmpty('Belum ada Artikel terbaru'));
          } else {
            emit(ListMovieHasData(data));
          }
        },
      );
    });
  }
}
