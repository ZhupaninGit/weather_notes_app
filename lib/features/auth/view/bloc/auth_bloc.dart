import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_notes_app/features/auth/repositories/auth_repository.dart';
import 'package:weather_notes_app/features/auth/repositories/auth_repository_interface.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositoryInterface _authRepository;
  AuthBloc({required AuthRepositoryInterface repository}) : _authRepository = repository, super(const AuthState.authInitial()) {
    on<SignInWithGoogleEvent>(_signInWithGoogle);
    on<LogOutEvent>(_logOut);
  }

  Future<void> _signInWithGoogle(
    SignInWithGoogleEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthLoading());
      await _authRepository.signInWithGoogle();
      emit(const AuthSuccess());
    } on AuthException catch (e) {
      emit(AuthFailure(e.code));
    }
  }

  Future<void> _logOut(LogOutEvent event, Emitter<AuthState> emit) async {
    try {
      emit(const AuthLoading());
      await _authRepository.logOut();
      emit(const AuthSuccess());
    } on AuthException catch (e) {
      emit(AuthFailure(e.code));
    }
  }
}
