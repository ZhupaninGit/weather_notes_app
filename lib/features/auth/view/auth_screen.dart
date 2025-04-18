import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_notes_app/core/router/router.dart';
import 'package:weather_notes_app/core/ui/widgets/custom_snackbar.dart';
import 'package:weather_notes_app/core/ui/widgets/loading_overlay_widget.dart';
import 'package:weather_notes_app/features/auth/view/bloc/auth_bloc.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Notes"),
        centerTitle: true,
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Stack(children: [
            Padding(
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
                  _LoginWithGoogleButton()
                ],
              ),
            ),
            if (state is AuthLoading) const LoadingOverlay(),
          ]);
        },
      ),
    );
  }
}

class _LoginWithGoogleButton extends StatefulWidget {
  const _LoginWithGoogleButton();

  @override
  State<_LoginWithGoogleButton> createState() => _LoginWithGoogleButtonState();
}

class _LoginWithGoogleButtonState extends State<_LoginWithGoogleButton> {
  void signInWithGoogle() {
    context.read<AuthBloc>().add(const AuthEvent.signInWithGoogleEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          context.router.replace(const HomeRoute());
        }
        if (state is AuthFailure) {
          CustomSnackBar()
              .showCustomSnackBar(context, state.error.toString(), true);
        }
      },
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: SizedBox(
              width: 24,
              height: 24,
              child: Image.asset('assets/images/google_icon.png'),
            ),
            onPressed: signInWithGoogle,
            label: const Text(
              "Continue with Google",
              style: TextStyle(color: Colors.black),
            ),
          ),
        );
      },
    );
  }
}
