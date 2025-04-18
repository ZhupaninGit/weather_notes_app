import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:weather_notes_app/features/auth/repositories/auth_repository_interface.dart';

class AuthRepository extends AuthRepositoryInterface {
  final _auth = FirebaseAuth.instance;
  final _googleAuth = GoogleSignIn();

  @override
  Future<void> signInWithGoogle() async {
    try {
      final googleUser = await _googleAuth.signIn();
      if (googleUser == null) return;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code);
    } catch (e) {
      throw AuthException("Something went wrong...");
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code);
    }
  }
}

class AuthException implements Exception {
  final String code;

  AuthException(this.code);
}
