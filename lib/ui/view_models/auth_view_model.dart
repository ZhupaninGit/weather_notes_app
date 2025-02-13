import 'package:flutter/material.dart';
import 'package:weather_notes_app/domain/services/auth_service.dart';
import 'package:weather_notes_app/ui/components/custom_snackbar.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final CustomSnackBar _snackBar = CustomSnackBar();

  bool get isLoggenIn => _authService.currentUser != null;

  Future<void> onSignInWithGoogleButtonPress(BuildContext context) async {
    final result = await _authService.signInWithGoogle();
    result.fold(
      (error) =>
          _snackBar.showCustomSnackBar(context, error.errorMessage, true),
      (success) =>
          _snackBar.showCustomSnackBar(context, success.message!, false),
    );
    notifyListeners();
  }

  Future<void> onSignOutButtonPress(BuildContext context) async {
    final result = await _authService.signOutUser();
    result.fold(
      (error) =>
          _snackBar.showCustomSnackBar(context, error.errorMessage, true),
      (success) =>
          _snackBar.showCustomSnackBar(context, success.message!, false),
    );
    notifyListeners();
  }
}
