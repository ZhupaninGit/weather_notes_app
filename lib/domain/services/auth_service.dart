import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:weather_notes_app/domain/models/failure.dart';
import 'package:weather_notes_app/domain/models/success.dart';

class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get onAuthStateChanged {
    return _firebaseAuth.authStateChanges();
  }

  Future<Either<Failure, Success>> signInWithGoogle() async {
    try {
      if (currentUser != null) {
        return Left(Failure(errorMessage: "You are already logged in."));
      }

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return Left(
            Failure(errorMessage: "Authorization was cancelled by user."));
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _firebaseAuth.signInWithCredential(credential);
      return Right(Success(result: null, message: "Authorized successfully."));
    } on FirebaseException {
      return Left(
        Failure(
            errorMessage:
                "Firebase error. Please check your internet connection."),
      );
    } on PlatformException {
      return Left(
        Failure(
            errorMessage:
                "Some error occured. Please check your internet connection and try again."),
      );
    } catch (_) {
      return Left(
        Failure(errorMessage: "Unknown error.Please,try again."),
      );
    }
  }

  Future<Either<Failure, Success>> signOutUser() async {
    try {
      if (currentUser == null) {
        return Left(Failure(errorMessage: "No user currently signed in."));
      }

      await GoogleSignIn().signOut();
      await _firebaseAuth.signOut();
      return Right(Success(result: null, message: "Signed out successfully."));
      
    } on FirebaseAuthException {
      return Left(Failure(
          errorMessage:
              "Firebase error. Please check your internet connection."));
    } on PlatformException {
      return Left(Failure(
          errorMessage:
              "Some error occured. Please check your internet connection and try again."));
    } catch (_) {
      return Left(Failure(errorMessage: "Unknown error.Please,try again."));
    }
  }
}
