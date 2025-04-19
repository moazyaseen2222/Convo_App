import 'package:convo_/core/theming/app_colors.dart';
import 'package:convo_/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.title, required this.onPressed});

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0.r)),
        ),
        backgroundColor: const WidgetStatePropertyAll(AppColors.mainBlue),
        fixedSize: WidgetStateProperty.all(Size(double.maxFinite, 60.0.h)),
      ),
      onPressed: onPressed,
      child: Text(title, style: AppTextStyles.font20RegularWhite),
    );
  }
}
