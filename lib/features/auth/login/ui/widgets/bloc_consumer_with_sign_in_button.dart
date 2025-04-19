import 'package:convo_/core/helpers/extensions.dart';
import 'package:convo_/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/app_widgets/app_button.dart';
import '../../../../../core/routing/routers.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../../logic/cubit/login_cubit.dart';

class BlocConsumerWithSignInButton extends StatelessWidget {
  const BlocConsumerWithSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.successfulColor,
              content: Text(
                'Sign in successful!',
                style: AppTextStyles.font13WhiteSemiBold,
              ),
            ),
          );
          context.pushReplacementNamed(Routes.homeScreen);
        } else if (state is LoginError) {
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
        if (state is LoginLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.mainBlue),
          );
        }
        return AppButton(
          title: 'Sign in',
          onPressed: () {
            validationThenDoLogin(context);
          },
        );
      },
    );
  }
}

// Form validation then login:
void validationThenDoLogin(BuildContext context) {
  if (context.read<LoginCubit>().formKey.currentState!.validate()) {
    final email = context.read<LoginCubit>().emailController.text.trim();
    final password = context.read<LoginCubit>().passwordControlle.text.trim();
    context.read<LoginCubit>().signIn(email, password);
  }
}
