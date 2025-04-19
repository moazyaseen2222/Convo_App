import 'package:supabase_flutter/supabase_flutter.dart';

class SetInfoWeb {
  // final SupabaseClient _client;

  // SetInfoWeb() : _client = Supabase.instance.client;

  Future<void> setProfileInfo(
    String userName,
    String bio,
    String status,
  ) async {
    final userId =
        Supabase.instance.client.auth.currentUser?.id; // get current userId

    // insert the data to supabase
    await Supabase.instance.client.from('userProfileData').insert([
      {'id': userId, 'name': userName, 'bio': bio, 'status': status},
    ]);
  }
}
