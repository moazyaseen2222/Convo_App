import '../web/login_web_service.dart';

class LoginRepo {
  final LoginWebService signInWebService;

  LoginRepo(this.signInWebService);

  Future<void> signInWithEmailPassword(String email, String password) async {
    return await signInWebService.signInWithEmailPassword(email, password);
  }
}
