import 'package:go_router/go_router.dart';
import 'package:starwars_movie_app/config/routes/app_routes.dart';
import 'package:starwars_movie_app/features/home/presentation/ui/home_screen.dart';
import 'package:starwars_movie_app/features/movie/domain/entities/movie.dart';
import 'package:starwars_movie_app/features/movie/presentation/ui/movie_detail_screen.dart';

class AppPages {
  static final router = GoRouter(
    initialLocation: AppPaths.home,
    routes: [
      GoRoute(
        name: AppRoutes.home,
        path: AppPaths.home,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        name: AppRoutes.movieDetail,
        path: AppPaths.movieDetail,
        builder: (context, state) {
          var movie = state.extra as Movie;
          return MovieDetailScreen(
            movie: movie,
          );
        },
      ),
    ],
  );
}
