import 'package:convo_/features/auth/auth_gate/auth_gate_screen.dart';
import 'package:convo_/features/auth/auth_gate/cubit/auth_gate_cubit.dart';
import 'package:convo_/features/auth/login/data/repos/login_repo.dart';
import 'package:convo_/features/auth/login/data/web/login_web_service.dart';
import 'package:convo_/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:convo_/features/auth/login/ui/login_screen.dart';
import 'package:convo_/features/auth/on_boarding_auth/ui/on_boarding_screen.dart';
import 'package:convo_/features/auth/reset_password/ui/reset_password_screen.dart';
import 'package:convo_/features/auth/sign_up/data/repo/sign_up_repo.dart';
import 'package:convo_/features/auth/sign_up/data/web/sign_up_web_service.dart';
import 'package:convo_/features/auth/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:convo_/features/auth/sign_up/ui/sign_up_screen.dart';
import 'package:convo_/features/porfile/logic/cubit/profile_cubit.dart';
import 'package:convo_/features/porfile/ui/profile_screen.dart';
import 'package:convo_/features/set_profile/data/repo/set_info_repo.dart';
import 'package:convo_/features/set_profile/data/web/set_info_web.dart';
import 'package:convo_/features/set_profile/logic/cubit/set_profile_cubit.dart';
import 'package:convo_/features/set_profile/ui/set_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/chat/ui/chat_screen.dart';
import '../../features/home/ui/home_screen.dart';
import 'routers.dart';

class AppRouters {
  // Sign in
  late LoginRepo loginRepo;
  late LoginCubit loginCubit;

  // Sign up
  late SignUpRepo signUpRepo;
  late SignUpCubit signUpCubit;

  // Set Profile
  late SetInfoRepo setInfoRepo;
  late SetInfoCubit setInfoCubit;

  AppRouters() {
    // Sign in
    loginRepo = LoginRepo(LoginWebService());
    loginCubit = LoginCubit(loginRepo);

    // Sign up
    signUpRepo = SignUpRepo(SignUpWebService());
    signUpCubit = SignUpCubit(signUpRepo);

    // Set Info
    setInfoRepo = SetInfoRepo(SetInfoWeb());
    setInfoCubit = SetInfoCubit(setInfoRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.authGate:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => AuthGateCubit(),
                child: const AuthGateScreen(),
              ),
        );

      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => AuthGateCubit(),
                child: const OnBoardingAuth(),
              ),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => loginCubit,
                child: const LoginScreen(),
              ),
        );

      case Routes.signupScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => signUpCubit,
                child: const SignUpScreen(),
              ),
        );

      case Routes.setProfileScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => SetInfoCubit(setInfoRepo),
                child: const SetProfileScreen(),
              ),
        );

      case Routes.resetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Routes.chatScreen:
        return MaterialPageRoute(builder: (_) => const ChatScreen());

      case Routes.profileScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => ProfileCubit(),
                child: const ProfileScreen(),
              ),
        );

      default:
        return null;
    }
  }
}
