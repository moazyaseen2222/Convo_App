import 'package:convo_/core/helpers/extensions.dart';
import 'package:convo_/core/theming/app_text_styles.dart';
import 'package:convo_/features/porfile/logic/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/app_widgets/app_button.dart';
import '../../../../core/routing/routers.dart';
import '../../../../core/theming/app_colors.dart';

class BlocConsumerWithSaveButton extends StatelessWidget {
  const BlocConsumerWithSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileSucess) {
          // Show snack bar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Profile set successfully',
                style: AppTextStyles.font13WhiteSemiBold,
              ),
              backgroundColor: AppColors.mainBlue,
            ),
          );
          //Navigate to home
          context.pushReplacementNamed(Routes.homeScreen);
        } else if (state is ProfileError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.message,
                style: AppTextStyles.font13WhiteSemiBold,
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.mainBlue),
          );
        }

        return AppButton(
          title: 'Save',
          onPressed: () {
            // Confirm the data
            context.read<ProfileCubit>().updateProfile(
              context.read<ProfileCubit>().nameController.text,
              context.read<ProfileCubit>().bioController.text,
              context.read<ProfileCubit>().userStatus,
            );
          },
        );
      },
    );
  }
}
