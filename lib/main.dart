import 'package:flutter/material.dart';
import 'package:starwars_movie_app/config/routes/app_pages.dart';

void main() {
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
