import 'package:bloc/bloc.dart';
import 'package:convo_/features/set_profile/data/repo/set_info_repo.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'set_profile_state.dart';

class SetInfoCubit extends Cubit<SetProfileState> {
  final SetInfoRepo _setInfoRepo;
  SetInfoCubit(this._setInfoRepo) : super(SetProfileInitial());

  late TextEditingController nameController;
  late TextEditingController bioController;

  final formKey = GlobalKey<FormState>();

  final SupabaseClient client = Supabase.instance.client;

  late String userStatus;

  Future<void> settingProfile(
    String userName,
    String bio,
    String status,
  ) async {
    try {
      await _setInfoRepo.setInfo(userName, bio, status);
      emit(SetProfileSuccess());
    } catch (e) {
      if (e.toString().contains('Failed host lookup')) {
        emit(SetProfileError('No internet connection'));
      }
      emit(SetProfileError(e.toString()));
    }
  }
}
