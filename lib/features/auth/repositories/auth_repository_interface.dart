abstract class AuthRepositoryInterface {
  Future<void> signInWithGoogle();
  Future<void> logOut();
}