import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_notes_app/features/home/view/bloc/weather_bloc/weather_bloc.dart';
import 'widget.dart';

import '../../../../data/models/weather.dart';

class ExpandedWeatherWidget extends StatelessWidget {
  const ExpandedWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.surface,
              Theme.of(context).primaryColor
            ]),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                spreadRadius: 2,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ]),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherFailure) {
              return ErrorWeatherWidget(
                message: state.message,
              );
            }
            if (state is WeatherSuccess) {
              return _CurrentWeather(weather: state.weather);
            }
            return _LoadingWidget();
          },
        ));
  }
}

class _CurrentWeather extends StatelessWidget {
  const _CurrentWeather({
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: MainWeatherConditions(weather: weather)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: AdditionalWeatherConditions(weather: weather),
        ),
        const SizedBox(
          width: 15,
        )
      ],
    );
  }
}


class _LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        SizedBox(
          height: 15,
        ),
        Text(
          "Getting you weather,please wait...",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
