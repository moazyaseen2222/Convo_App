import 'package:convo_/features/porfile/data/web/profile_web.dart';

class ProfileRepo {
  final ProfileWeb _profileWeb;

  ProfileRepo(this._profileWeb);

  Future<void> updateInfo(String userName, String bio, String status) async {
    await _profileWeb.updateProfile(userName, bio, status);
  }
}
