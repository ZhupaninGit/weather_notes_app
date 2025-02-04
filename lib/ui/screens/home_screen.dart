import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_notes_app/ui/view_models/auth_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:  [
          IconButton(
            onPressed: () async {
              await context.read<AuthViewModel>().onSignOutButtonPress(context);
            },
            icon:const Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: const Center(
        child: Text("Home"),
      ),
    );
  }
}
