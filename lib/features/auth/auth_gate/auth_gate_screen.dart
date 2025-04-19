import 'package:convo_/core/theming/app_colors.dart';
import 'package:convo_/features/auth/auth_gate/cubit/auth_gate_cubit.dart';
import 'package:convo_/features/auth/on_boarding_auth/ui/on_boarding_screen.dart';
import 'package:convo_/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthGateScreen extends StatelessWidget {
  const AuthGateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthGateCubit, AuthStatus>(
      builder: (context, state) {
        if (state == AuthStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.mainBlue),
          );
        } else if (state == AuthStatus.authenicated) {
          return const HomeScreen();
        } else {
          return const OnBoardingAuth();
        }
      },
    );
  }
}
