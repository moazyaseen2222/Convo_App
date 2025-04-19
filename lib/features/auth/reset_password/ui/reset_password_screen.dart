import 'package:convo_/core/app_widgets/convo_head_line.dart';
import 'package:convo_/core/helpers/spaces.dart';
import 'package:convo_/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: Column(
            children: [
              verticalSpace(50.h),
              ConvoHeadLine(textStyle: AppTextStyles.font20BoldTextColor),
              verticalSpace(50.h),
              Text(
                'Reset Password',
                style: AppTextStyles.font15NormalTextColor,
              ),
              verticalSpace(20.h),
              const Row(
                children: [
                  // TODO : OTP package
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
