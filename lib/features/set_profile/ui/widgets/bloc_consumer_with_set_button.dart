import 'package:convo_/core/helpers/extensions.dart';
import 'package:convo_/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce/hive.dart';
import '../../../../core/app_widgets/app_button.dart';
import '../../../../core/routing/routers.dart';
import '../../../../core/theming/app_colors.dart';
import '../../logic/cubit/set_profile_cubit.dart';

class BlocConsumerWithCompleteButton extends StatelessWidget {
  const BlocConsumerWithCompleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SetInfoCubit, SetProfileState>(
      listener: (context, state) {
        if (state is SetProfileSuccess) {
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
        } else if (state is SetProfileError) {
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
        if (state is SetProfileLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.mainBlue),
          );
        }

        return AppButton(
          title: 'Complete',
          onPressed: () {
            // Confirm the data
            context.read<SetInfoCubit>().settingProfile(
              context.read<SetInfoCubit>().nameController.text,
              context.read<SetInfoCubit>().bioController.text,
              context.read<SetInfoCubit>().userStatus,
            );
          },
        );
      },
    );
  }
}
