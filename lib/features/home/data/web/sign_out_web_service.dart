import 'package:supabase_flutter/supabase_flutter.dart';

class SignOutWebService {
  final SupabaseClient _supabse = Supabase.instance.client;

  ///Sign out with supabase:
  Future<void> signInWithEmailPassword() async {
    await _supabse.auth.signOut();
  }
}
