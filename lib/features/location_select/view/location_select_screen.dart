import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_notes_app/core/ui/widgets/custom_snackbar.dart';
import 'package:weather_notes_app/features/home/view/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_notes_app/features/location_select/view/bloc/location_select_bloc.dart';

@RoutePage()
class LocationSelectScreen extends StatelessWidget {
  const LocationSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Location select")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BlocListener<LocationSelectBloc, LocationSelectState>(
              listener: (context, state) {
                if (state is LocationSelectDeleteSuccess) {
                  context.read<WeatherBloc>().add(FetchWeatherEvent());
                  CustomSnackBar().showCustomSnackBar(
                      context, "Using current location now.", false);
                  context.back();
                }
              },
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => context
                      .read<LocationSelectBloc>()
                      .add(DeleteSelectedLocation()),
                  label: const Text("Use current device location"),
                  icon: const Icon(Icons.location_on_outlined),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text("or"),
            ),
            TextField(
              onChanged: (value) => context
                  .read<LocationSelectBloc>()
                  .add(FetchLocationsBasedOnUserInput(input: value)),
              decoration: const InputDecoration(
                labelText: "Search your location",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const _ListOfPredictedPlaces()
          ],
        ),
      ),
    );
  }
}

class _ListOfPredictedPlaces extends StatelessWidget {
  const _ListOfPredictedPlaces();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationSelectBloc, LocationSelectState>(
      listener: (context, state) {
        if (state is LocationSelectUpdateSuccess) {
          context.read<WeatherBloc>().add(FetchWeatherEvent());
          CustomSnackBar().showCustomSnackBar(
              context, "Location selected successffully.", false);
          context.back();
        }
      },
      builder: (context, state) {
        if (state is LocationSelectLoading) {
          return const CircularProgressIndicator();
        }

        if (state is LocationSelectFailure) {
          return const Text(
            "Some error occurred. Please check your internet connection.",
            textAlign: TextAlign.center,
          );
        }

        if (state is LocationSelectSuccess) {
          if (state.predictions.isEmpty) {
            return const Text("No results.");
          }

          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.0),
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemCount: state.predictions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      state.predictions[index].description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onTap: () {
                      context.read<LocationSelectBloc>().add(
                          UpdateSelectedLocation(state.predictions[index]));
                    },
                  );
                },
              ),
            ),
          );
        }

        return const Text("Start typing...");
      },
    );
  }
}
