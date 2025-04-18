import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_notes_app/core/router/router.dart';
import 'package:weather_notes_app/features/home/view/bloc/weather_bloc/weather_bloc.dart';

class ErrorWeatherWidget extends StatelessWidget {
  final String message;

  const ErrorWeatherWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.white);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: textStyle,
          ),
          const SizedBox(
            height: 15,
          ),
          OutlinedButton.icon(
            onPressed: () =>
                context.read<WeatherBloc>().add(WeatherEvent.fetchWeather()),
            label: const Text(
              "Retry",
              style: textStyle,
            ),
            icon: const Icon(Icons.replay_rounded),
          ),
          OutlinedButton.icon(
            onPressed: () => context.navigateTo(LocationSelectRoute()),
            label: const Text(
              "Change location",
              style: textStyle,
            ),
            icon: const Icon(Icons.location_off_outlined),
          ),
        ],
      ),
    );
  }
}