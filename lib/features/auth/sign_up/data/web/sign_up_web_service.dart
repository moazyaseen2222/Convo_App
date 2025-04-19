import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpWebService {
  // final SupabaseClient _supabse = Supabase.instance.client;

  final SupabaseClient _client;

  SignUpWebService() : _client = Supabase.instance.client;

  ///Sign up with supabase:
  Future<void> signUp(String email, String password) async {
    final response =
        await _client.auth.signUp(password: password, email: email);

    if (response.user == null) {
      throw Exception('***** Error ***** : eroor !');
    }
  }
}