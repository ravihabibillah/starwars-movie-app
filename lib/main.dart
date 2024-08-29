import 'package:flutter/material.dart';
import 'package:starwars_movie_app/config/routes/app_pages.dart';
import 'package:starwars_movie_app/injection.dart' as inject;

void main() {
  inject.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppPages.router,
    );
  }
}
