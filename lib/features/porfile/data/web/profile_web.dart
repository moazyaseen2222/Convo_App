import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileWeb {
  Future<void> updateProfile(String userName, String bio, String status) async {
    final userId =
        Supabase.instance.client.auth.currentUser?.id; // get current userId

    // update the data to supabase
    await Supabase.instance.client
        .from('userProfileData')
        .update({'name': userName, 'bio': bio, 'status': status})
        .eq('id', userId!);

    // await Supabase.instance.client
    //     .from('userProfileData')
    //     .update(
    //       [
    //             {'id': userId, 'name': userName, 'bio': bio, 'status': status},
    //           ]
    //           as Map,
    //     );
  }
}
