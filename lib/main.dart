import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:mapbox_search/mapbox_search.dart';
import 'package:provider/provider.dart';
import 'package:starwars_movie_app/config/provider_setting.dart';
import 'package:starwars_movie_app/config/routes/app_pages.dart';
import 'package:starwars_movie_app/config/themes/app_color.dart';
import 'package:starwars_movie_app/injection.dart' as inject;
import 'package:starwars_movie_app/utils/notification_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  inject.init();
  initializeDateFormatting('id');

  // Pass your access token to MapboxOptions so you can load a map
  String ACCESS_TOKEN = const String.fromEnvironment("ACCESS_TOKEN");

  MapBoxSearch.init(ACCESS_TOKEN);
  NotificationService().initNotification();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderSetting.mainProvider,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppPages.router,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: AppColor.primaryColor,
              foregroundColor: AppColor.onPrimaryColor),
        ),
      ),
    );
  }
}
