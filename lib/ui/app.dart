import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_notes_app/ui/screens/auth_screen.dart';
import 'package:weather_notes_app/ui/theme/app_theme.dart';
import 'package:weather_notes_app/ui/view_models/auth_view_model.dart';

class WeatherNotesApp extends StatelessWidget {
  const WeatherNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthViewModel(),
        )
      ],
      child: MaterialApp(
        theme: AppTheme.theme,
        home: AuthScreen(),
      ),
    );
  }
}
