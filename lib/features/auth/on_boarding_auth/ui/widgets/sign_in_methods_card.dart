import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class AuthHelperButton extends StatelessWidget {
  const AuthHelperButton({
    super.key,
    this.methodLogoName,
    required this.onTap,
  });

  final String? methodLogoName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap;
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 15.0.h),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
            child: Image(
              height: 30.h,
              image: AssetImage(methodLogoName!),
            ),
          ),
        ),
      ),
    );
  }
}
