import 'package:convo_/features/set_profile/data/web/set_info_web.dart';

class SetInfoRepo {
  final SetInfoWeb _setInfoWeb;

  SetInfoRepo(this._setInfoWeb);

  Future<void> setInfo(String userName, String bio, String status) async {
    await _setInfoWeb.setProfileInfo(userName, bio, status);
  }
}
