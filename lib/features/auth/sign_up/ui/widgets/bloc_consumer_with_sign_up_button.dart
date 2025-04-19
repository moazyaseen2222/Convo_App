import 'package:convo_/core/helpers/extensions.dart';
import 'package:convo_/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/app_widgets/app_button.dart';
import '../../../../../core/routing/routers.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../logic/cubit/sign_up_cubit.dart';

class BlocConsumerWithSignUpButton extends StatelessWidget {
  const BlocConsumerWithSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          context.pushReplacementNamed(Routes.setProfileScreen);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.successfulColor,
              content: Text(
                'Sign Up successful!',
                style: AppTextStyles.font13WhiteSemiBold,
              ),
            ),
          );
        } else if (state is SignUpError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.grey,
              content: Text(
                state.message,
                style: AppTextStyles.font13WhiteSemiBold,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is SignUpLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.mainBlue),
          );
        }
        return AppButton(
          title: 'Sign up',
          onPressed: () {
            validationThenSignUp(context);
          },
        );
      },
    );
  }
}

// Form validation then Sign Up:
void validationThenSignUp(BuildContext context) {
  if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
    final email = context.read<SignUpCubit>().emailController.text.trim();
    final password = context.read<SignUpCubit>().passwordController.text.trim();
    context.read<SignUpCubit>().signUp(email, password);
  }
}
