import 'package:convo_/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routing/routers.dart';
import '../../../../../core/theming/app_text_styles.dart';

class ContinueWithGmail extends StatelessWidget {
  const ContinueWithGmail({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(Routes.loginScreen),
      child: Padding(
        padding: EdgeInsets.only(bottom: 15.0.h),
        child: Card(
          color: Colors.grey.shade100,
          child: Padding(
            padding: EdgeInsets.only(top: 15.0.h, bottom: 15.h),
            child: Center(
              child: Text(
                'Continue with Gmail',
                style: AppTextStyles.font15NormalTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
