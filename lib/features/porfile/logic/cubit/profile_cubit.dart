import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  String? name;
  String? bio;
  String? status;
  String? imageUrl;

  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  final SupabaseClient supabase = Supabase.instance.client;

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
      emit(ProfilError(e.toString()));
    }
  }
}
