import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_notes_app/features/home/view/bloc/weather_bloc/weather_bloc.dart';

import '../../../data/models/weather.dart';

class CollapsedWeatherWidget extends StatelessWidget {
  const CollapsedWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherSuccess) {
              return _CurrentWeatherCollapsed(weather: state.weather);
            }
            return const _TitleWidget();
          },
        ));
  }
}

class _CurrentWeatherCollapsed extends StatelessWidget {
  final Weather weather;
  const _CurrentWeatherCollapsed({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          '${weather.temperature.round()}°',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            weather.icon,
            const SizedBox(width: 9),
            Text(weather.weatherConditions,
                style: const TextStyle(fontSize: 16)),
          ],
        ),
      ],
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(width: 15),
        Text("Weather Notes",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w900)),
      ],
    );
  }
}
