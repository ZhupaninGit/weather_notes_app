import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weather_notes_app/core/router/router.dart';

import '../../../data/models/weather.dart';

class MainWeatherConditions extends StatelessWidget {
  final Weather weather;
  const MainWeatherConditions({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: TextButton.icon(
                onPressed: () => context.navigateTo(LocationSelectRoute()),
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(
                        Theme.of(context).colorScheme.primary)),
                label: Text(
                  weather.city,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                icon: Icon(
                  Icons.location_on_outlined,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ],
        ),
        Text(
          '${weather.temperature.round().toString()}°',
          style: TextStyle(
              fontSize: 46,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            weather.icon,
            SizedBox(width: 7),
            Text(weather.weatherConditions,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
          ],
        ),
      ],
    );
  }
}
