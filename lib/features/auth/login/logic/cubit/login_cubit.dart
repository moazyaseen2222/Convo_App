import 'package:bloc/bloc.dart';
import 'package:convo_/features/auth/login/data/repos/login_repo.dart';
import 'package:flutter/widgets.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo signInRepo;

  late TextEditingController emailController;
  late TextEditingController passwordControlle;

  final formKey = GlobalKey<FormState>();

  LoginCubit(this.signInRepo) : super(LoginInitial());

  Future<void> signIn(String email, String password) async {
    try {
      emit(LoginLoading());
      await signInRepo.signInWithEmailPassword(email, password);
      emit(LoginSuccess());
    } catch (e) {
      if (e.toString().contains('Failed host lookup')) {
        // emit(LoginError('No Internet!'));
        emit(LoginError(e.toString()));
      } else if (e.toString().contains('Invalid login credentials')) {
        emit(LoginError('Email or password is not correct!'));
      } else {
        emit(LoginError(e.toString()));
      }
    }
  }
}
