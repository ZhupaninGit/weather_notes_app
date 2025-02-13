import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_notes_app/domain/models/weather.dart';
import 'package:weather_notes_app/ui/screens/location_select/location_select_screen.dart';
import 'package:weather_notes_app/ui/view_models/location_view_model.dart';
import 'package:weather_notes_app/ui/view_models/weather_view_model.dart';

class ExpandedWeatherWidget extends StatelessWidget {
  const ExpandedWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<WeatherViewModel>();
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
        child: Padding(
          padding: EdgeInsets.all(15),
          child: viewModel.errorMessage != null
              ? _ErrorWidget()
              : viewModel.currentWeather == null
                  ? _LoadingWidget()
                  : _CurrentWidgetInfo(
                      weather: viewModel.currentWeather!,
                    ),
        ));
  }
}

class _CurrentWidgetInfo extends StatelessWidget {
  const _CurrentWidgetInfo({
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: _MainWeatherConditions(weather: weather)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: _AdditionalWeatherConditions(weather: weather),
        ),
        const SizedBox(
          width: 15,
        )
      ],
    );
  }
}

class _MainWeatherConditions extends StatelessWidget {
  final Weather weather;
  const _MainWeatherConditions({required this.weather});

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
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ChangeNotifierProvider(
                      create: (_) => PlaceViewModel(),
                      child: LocationSelectScreen(),
                    ),
                  ),
                ),
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

class _AdditionalWeatherConditions extends StatelessWidget {
  const _AdditionalWeatherConditions({
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Container(
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

class _ErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<WeatherViewModel>();
    const textStyle = TextStyle(color: Colors.white);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          viewModel.errorMessage!,
          textAlign: TextAlign.center,
          style: textStyle,
        ),
        const SizedBox(
          height: 15,
        ),
        OutlinedButton.icon(
          onPressed: viewModel.updateWeather,
          label: const Text(
            "Retry",
            style: textStyle,
          ),
          icon: const Icon(Icons.replay_rounded),
        ),
        OutlinedButton.icon(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ChangeNotifierProvider(
                create: (_) => PlaceViewModel(),
                child: LocationSelectScreen(),
              ),
            ),
          ),
          label: const Text(
            "Change location",
            style: textStyle,
          ),
          icon: const Icon(Icons.location_off_outlined),
        ),
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
