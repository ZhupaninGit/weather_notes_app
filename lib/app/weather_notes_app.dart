import 'package:flutter/material.dart';
import 'package:weather_notes_app/app/app_initializer.dart';
import 'package:weather_notes_app/core/router/router.dart';
import 'package:weather_notes_app/core/ui/theme/app_theme.dart';

class WeatherNotesApp extends StatefulWidget {
  const WeatherNotesApp({super.key});

  @override
  State<WeatherNotesApp> createState() => _WeatherNotesAppState();
}

class _WeatherNotesAppState extends State<WeatherNotesApp> {
  final _router = AppRouter();
  @override
  Widget build(BuildContext context) {
    return AppInitializer(
      child: MaterialApp.router(
        theme: AppTheme.theme,
        routerConfig: _router.config(),
      ),
    );
  }
}
