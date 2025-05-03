import 'package:convo_/core/app_widgets/app_error.dart';
import 'package:convo_/core/app_widgets/app_loading.dart';
import 'package:convo_/core/helpers/extensions.dart';
import 'package:convo_/core/routing/routers.dart';
import 'package:convo_/core/theming/app_colors.dart';
import 'package:convo_/core/theming/app_text_styles.dart';
import 'package:convo_/features/porfile/logic/cubit/profile_cubit.dart';
import 'package:convo_/features/porfile/ui/widgets/edit_dialog.dart';
import 'package:convo_/features/porfile/ui/widgets/image_name_bio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // context.read<ProfileCubit>().fetchUserData();
    context.read<ProfileCubit>().fetchLocalUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainBlue,
        centerTitle: true,
        title: Text('My Profile', style: AppTextStyles.font20RegularWhite),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              context.pushReplacementNamed(Routes.editProfileScreen);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const AppLoading();
            } else if (state is ProfileSucess) {
              return const ImageNameBio();
            } else if (state is ProfileError) {
              return AppError(errorMessage: state.message);
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }
}
