import 'package:supabase_flutter/supabase_flutter.dart';

class LoginWebService {
  // final SupabaseClient _supabse = Supabase.instance.client;

  final SupabaseClient _client;

  LoginWebService() : _client = Supabase.instance.client;

  ///Sign in with supabase:
  Future<void> signInWithEmailPassword(String email, String password) async {
    final response =
        await _client.auth.signInWithPassword(email: email, password: password);
    if (response.user == null) {
      throw Exception('***** Error ***** : User Not Found !');
    }
  }
}
