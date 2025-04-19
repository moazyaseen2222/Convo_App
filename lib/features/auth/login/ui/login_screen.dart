import 'package:convo_/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_widgets/convo_head_line.dart';
import '../../../../core/helpers/spaces.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../on_boarding_auth/ui/widgets/dont_have_account.dart';
import 'widgets/bloc_consumer_with_sign_in_button.dart';
import 'widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                const BackButton(color: AppColors.mainBlue),
                verticalSpace(70.h),

                // Convo head line
                ConvoHeadLine(textStyle: AppTextStyles.font40BoldTextColor),
                verticalSpace(30.h),

                // Sign in with gmail text \\
                Center(
                  child: Text(
                    'Sign in with Gmail',
                    style: AppTextStyles.font20BoldTextColor,
                  ),
                ),
                verticalSpace(30.h),

                // Sign in form \\
                const LoginForm(),
                verticalSpace(20.h),

                // Forgot password? \\
                Padding(
                  padding: EdgeInsets.only(left: 10.0.w),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: AlertDialog(
                              actions: [
                                TextButton(
                                  onPressed: () => context.pop(),
                                  child: Text(
                                    'Cancel',
                                    style: AppTextStyles.font13BlueRegular
                                        .copyWith(color: Colors.red),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // TODO : Send code to email
                                  },
                                  child: Text(
                                    'Send',
                                    style: AppTextStyles.font13BlueRegular,
                                  ),
                                ),
                              ],
                              content: const Text(
                                'We will send code to your email',
                              ),
                              title: Row(
                                children: [
                                  const Icon(
                                    Icons.restart_alt_outlined,
                                    color: AppColors.mainBlue,
                                  ),
                                  horiznetlSpace(5.w),
                                  Text(
                                    'Reset Password?',
                                    style: AppTextStyles.font15BlackBold,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      'Forgot password?',
                      style: AppTextStyles.font13BlackBoldUnderline,
                    ),
                  ),
                ),
                verticalSpace(150),

                // Bloc Consumer With  Sign in button \\
                const BlocConsumerWithSignInButton(),
                verticalSpace(50.h),

                // Dont Have account? \\
                const Center(child: DontHaveAccount()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
