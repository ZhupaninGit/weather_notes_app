import 'package:flutter/material.dart';

import '../../../data/models/weather.dart';

class AdditionalWeatherConditions extends StatelessWidget {
  const AdditionalWeatherConditions({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 16, right: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.all(
            Radius.circular(18),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ]),
      child: Column(
        children: [
          _WeatherDetailsComponent(
            value: weather.windSpeed,
            icon: Icons.wind_power_outlined,
            text: "Wind",
            metric: "m/s",
          ),
          const SizedBox(height: 22),
          _WeatherDetailsComponent(
            value: weather.humidity,
            icon: Icons.water_drop_outlined,
            text: "Humidity ",
            metric: "%",
          ),
        ],
      ),
    );
  }
}

class _WeatherDetailsComponent extends StatelessWidget {
  const _WeatherDetailsComponent(
      {required this.value,
      required this.icon,
      required this.text,
      required this.metric});

  final num value;
  final IconData icon;
  final String text;
  final String metric;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 20, color: Theme.of(context).colorScheme.surface),
        Text(
          '$value $metric',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(text),
      ],
    );
  }
}
