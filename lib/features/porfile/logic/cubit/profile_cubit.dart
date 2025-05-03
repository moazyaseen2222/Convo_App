import 'package:bloc/bloc.dart';
import 'package:convo_/features/porfile/data/repo/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo) : super(ProfileInitial());

  final ProfileRepo _profileRepo;

  String? name;
  String? bio;
  String? status;
  String? imageUrl;

  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  final SupabaseClient supabase = Supabase.instance.client;

  final formKey = GlobalKey<FormState>();
  // fetch user data from hive
  Future<void> fetchLocalUserData() async {
    var box = Hive.box('userDataBox');
    name = box.get('userName');
    bio = box.get('userBio');
    status = box.get('userStatus');

    // fetch image from supabase
    final userId = supabase.auth.currentUser?.id;
    imageUrl = supabase.storage
        .from('usersimages')
        .getPublicUrl('$userId/profile');
  }

  Future<void> fetchUserData() async {
    final userId = supabase.auth.currentUser?.id;

    imageUrl = supabase.storage
        .from('usersimages')
        .getPublicUrl('$userId/profile');

    if (userId == null) return;

    try {
      final response =
          await supabase
              .from('userProfileData')
              .select('name, bio, status')
              .eq('id', userId)
              .single();

      name = response['name'] ?? 'No Name';
      bio = response['bio'] ?? 'No Bio';
      status = response['status'] ?? 'No Status';

      emit(ProfileSucess());
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  late String userStatus;

  Future<void> updateProfile(String userName, String bio, String status) async {
    try {
      await _profileRepo.updateInfo(userName, bio, status);
      emit(ProfileLoading());
    } catch (e) {
      if (e.toString().contains('Failed host lookup')) {
        emit(ProfileError('No internet connection'));
      }
      emit(ProfileError(e.toString()));
    }
  }
}
