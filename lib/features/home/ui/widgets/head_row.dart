import 'package:convo_/core/helpers/extensions.dart';
import 'package:convo_/core/routing/routers.dart';
import 'package:convo_/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_widgets/convo_head_line.dart';

class HeadRow extends StatelessWidget {
  const HeadRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Image & Status \\
        GestureDetector(
          onTap: () {
            // to profile screen
            context.pushNamed(Routes.profileScreen);
          },
          child: Stack(
            children: [
              CircleAvatar(
                radius: 25.r,
                backgroundImage: const AssetImage('images/person.png'),
              ),
              Positioned(
                top: 35.h,
                left: 35.w,
                child: Container(
                  height: 15.h,
                  width: 15.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
              ),
            ],
          ),
        ),
        ConvoHeadLine(textStyle: AppTextStyles.font18BoldTextColor),

        // Search Icon \\
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search_outlined, size: 30),
        ),
      ],
    );
  }
}
