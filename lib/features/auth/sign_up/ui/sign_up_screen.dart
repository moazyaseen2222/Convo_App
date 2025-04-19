import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_widgets/convo_head_line.dart';
import '../../../../core/helpers/spaces.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../login/ui/widgets/have_account.dart';
import 'widgets/bloc_consumer_with_sign_up_button.dart';
import 'widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackButton(
                  color: AppColors.mainBlue,
                ),
                verticalSpace(70.h),

                // Convo head line \\
                ConvoHeadLine(textStyle: AppTextStyles.font40BoldTextColor),
                verticalSpace(30.h),

                // Create new account \\
                Center(
                    child: Text('Create new account',
                        style: AppTextStyles.font20BoldTextColor)),
                verticalSpace(30.h),

                // Sign up form \\
                const SignUpForm(),

                verticalSpace(70.h),

                // Sign up button \\
                const BlocConsumerWithSignUpButton(),
                verticalSpace(50.h),

                // Have account? \\
                const Center(child: HaveAccount()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
