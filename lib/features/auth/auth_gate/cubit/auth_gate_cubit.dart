import 'package:bloc/bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum AuthStatus { authenicated, unauthenicated, loading }

class AuthGateCubit extends Cubit<AuthStatus> {
  AuthGateCubit() : super(AuthStatus.loading) {
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    final session = Supabase.instance.client.auth.currentSession;
    if (session != null) {
      emit(AuthStatus.authenicated);
    } else {
      emit(AuthStatus.unauthenicated);
    }
  }

  void signInWithGoogle() async {
    final supabase = Supabase.instance.client;

    await supabase.auth.signInWithOAuth(
      OAuthProvider.google,
      redirectTo: 'io.supabase.flutter://login-callback', // For mobile
    );
  }
}
