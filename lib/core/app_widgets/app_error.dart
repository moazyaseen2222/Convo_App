import 'package:convo_/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppError extends StatelessWidget {
  const AppError({super.key, required this.errorMessage});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 80.h,
        width: 100.w,
        color: Colors.red,
        child: Center(
          child: Text(
            'Error : $errorMessage',
            style: AppTextStyles.font13WhiteSemiBold,
          ),
        ),
      ),
    );
  }
}
