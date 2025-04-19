import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spaces.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';

class HeadBarRow extends StatelessWidget {
  const HeadBarRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const BackButton(
          color: AppColors.mainBlue,
        ),
        horiznetlSpace(90.w),
        Text(
          'Profile',
          style: AppTextStyles.font18BoldTextColor,
        )
      ],
    );
  }
}
