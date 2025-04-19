import 'package:bloc/bloc.dart';
import 'package:convo_/features/auth/auth_gate/cubit/auth_gate_cubit.dart';
import 'package:convo_/features/auth/sign_up/data/repo/sign_up_repo.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;

  SignUpCubit(this._signUpRepo) : super(SignUpInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> signUp(String email, String password) async {
    try {
      emit(SignUpLoading());
      await _signUpRepo.signUp(email, password);
      emit(SignUpSuccess());
    } catch (e) {
      if (e.toString().contains('Failed host lookup')) {
        emit(SignUpError('No Internet!'));
      } else if (e.toString().contains('email-already-in-use')) {
        emit(SignUpError('Email already is use !'));
      } else {
        emit(SignUpError(e.toString()));
      }
    }
  }
}
