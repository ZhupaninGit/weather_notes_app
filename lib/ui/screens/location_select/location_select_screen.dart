import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_notes_app/ui/view_models/location_view_model.dart';

class LocationSelectScreen extends StatelessWidget {
  const LocationSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<PlaceViewModel>();
    return Scaffold(
      appBar: AppBar(title: const Text("Location select")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => viewModel.deleteSelectedLocation(context),
                label: const Text("Use current device location"),
                icon: const Icon(Icons.location_on_outlined),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text("or"),
            ),
            TextField(
              onChanged: (value) => viewModel.updateLocationPredictions(value),
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
    final viewModel = context.watch<PlaceViewModel>();
    final errorMessage = viewModel.errorMessage;
    final predictedPlaces = viewModel.predictedLocations;
    return errorMessage != null
        ? Text(errorMessage)
        : predictedPlaces == null
            ? const Text("Start typing to find your location...")
            : predictedPlaces.isEmpty
                ? const Text("No results.")
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: predictedPlaces.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(predictedPlaces[index].description,
                                style: Theme.of(context).textTheme.bodyMedium),
                            onTap: () => context
                                .read<PlaceViewModel>()
                                .getCoordinatesAndSetSelectedLocation(
                                    predictedPlaces[index], context),
                          );
                        },
                      ),
                    ),
                  );
  }
}
