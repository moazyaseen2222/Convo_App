import 'package:convo_/features/auth/sign_up/data/web/sign_up_web_service.dart';

class SignUpRepo {
  final SignUpWebService _signUpWebService;

  SignUpRepo(this._signUpWebService);

  Future<void> signUp(String email, String password) async {
    await _signUpWebService.signUp(email, password);
  }
}
