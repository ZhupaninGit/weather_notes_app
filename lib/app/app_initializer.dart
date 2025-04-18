import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_notes_app/features/auth/repositories/repositories.dart';
import 'package:weather_notes_app/features/auth/view/bloc/auth_bloc.dart';
import 'package:weather_notes_app/features/home/repositories/notes_repository/notes_repository.dart';
import 'package:weather_notes_app/features/home/repositories/notes_repository/notes_repository_interface.dart';
import 'package:weather_notes_app/features/home/repositories/weather_repository/repositories.dart';
import 'package:weather_notes_app/features/home/view/bloc/notes_bloc/notes_bloc.dart';
import 'package:weather_notes_app/features/home/view/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_notes_app/features/location_select/repositories/location_select_repository.dart';
import 'package:weather_notes_app/features/location_select/repositories/location_select_repository_interface.dart';
import 'package:weather_notes_app/features/location_select/view/bloc/location_select_bloc.dart';

class AppInitializer extends StatelessWidget {
  final Widget child;
  const AppInitializer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepositoryInterface>(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider<WeatherRepositoryInterface>(
          create: (context) => WeatherRepository(),
        ),
        RepositoryProvider<LocationSelectRepositoryInterface>(
          create: (context) => LocationSelectRepository(),
        ),
        RepositoryProvider<NotesRepositoryInterface>(
          create: (context) => NotesRepository(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              repository: context.read<AuthRepositoryInterface>(),
            ),
          ),
          BlocProvider(
            create: (context) => WeatherBloc(
              repository: context.read<WeatherRepositoryInterface>(),
            ),
          ),
          BlocProvider(
            create: (context) => LocationSelectBloc(
              repository: context.read<LocationSelectRepositoryInterface>(),
            ),
          ),
          BlocProvider(
            create: (context) => NotesBloc(
              repository: context.read<NotesRepositoryInterface>(),
            ),
          )
        ],
        child: child
      ),
    );
  }
}
