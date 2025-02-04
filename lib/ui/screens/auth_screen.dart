import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_notes_app/ui/screens/home_screen.dart';
import 'package:weather_notes_app/ui/view_models/auth_view_model.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AuthViewModel>();
    return viewModel.isLoggenIn ? HomeScreen() : _AuthWidget();
  }
}

class _AuthWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<AuthViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Notes"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login or Sign up to your account",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  icon: SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset('assets/images/google_icon.png'),
                  ),
                  onPressed: () async {
                    await viewModel.onSignInWithGoogleButtonPress(context);
                  },
                  label: const Text(
                    "Continue with Google",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
