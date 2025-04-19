import 'package:convo_/core/helpers/extensions.dart';
import 'package:convo_/core/routing/routers.dart';
import 'package:convo_/core/theming/app_colors.dart';
import 'package:convo_/features/auth/auth_gate/cubit/auth_gate_cubit.dart';
import 'package:convo_/features/auth/on_boarding_auth/ui/widgets/dont_have_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_widgets/convo_head_line.dart';
import '../../../../core/helpers/spaces.dart';
import '../../../../core/theming/app_text_styles.dart';
import 'widgets/phone_number_card.dart';
import 'widgets/or_widget.dart';
import 'widgets/sign_in_methods_card.dart';

class OnBoardingAuth extends StatelessWidget {
  const OnBoardingAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0.h, left: 30.w, right: 30.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Convo head line \\
              ConvoHeadLine(textStyle: AppTextStyles.font60BoldTextColor),

              Image(
                height: 200.h,
                image: const AssetImage('images/memories.jpg'),
              ),

              // Gmail \\
              const ContinueWithGmail(),

              const OrWidget(),

              // Google & Facebook \\
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthHelperButton(
                    methodLogoName: 'images/google.png',
                    onTap: () {
                      context.read<AuthGateCubit>().signInWithGoogle();
                    },
                  ),
                  horiznetlSpace(10.w),
                  AuthHelperButton(
                    methodLogoName: 'images/facebook.png',
                    onTap: () {},
                  ),
                ],
              ),

              // Dont have Account? \\
              const DontHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
