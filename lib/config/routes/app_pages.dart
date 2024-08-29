import 'package:go_router/go_router.dart';
import 'package:starwars_movie_app/config/routes/app_routes.dart';
import 'package:starwars_movie_app/features/home/presentation/ui/home_screen.dart';

class AppPages {
  static final router = GoRouter(
    initialLocation: AppPaths.home,
    routes: [
      GoRoute(
        name: AppRoutes.home,
        path: AppPaths.home,
        builder: (context, state) => HomeScreen(),
      ),
    ],
  );
}
