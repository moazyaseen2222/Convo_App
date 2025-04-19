import 'package:convo_/core/helpers/spaces.dart';
import 'package:convo_/core/theming/app_colors.dart';
import 'package:convo_/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScrollableChat extends StatefulWidget {
  const ScrollableChat({super.key});

  @override
  State<ScrollableChat> createState() => _ScrollableChatState();
}

class _ScrollableChatState extends State<ScrollableChat> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 650.h,
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Align(
                alignment:
                    index.isEven ? Alignment.bottomRight : Alignment.bottomLeft,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color:
                        index.isEven
                            ? AppColors.mainBlue
                            : const Color.fromARGB(182, 228, 226, 226),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.0.w,
                      vertical: 8.0.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Test message about loerm content',
                          style:
                              index.isEven
                                  ? AppTextStyles.font13WhiteSemiBold
                                  : AppTextStyles.font13BlackSemiBold,
                        ),
                        Text(
                          '2:45 PM',
                          style:
                              index.isEven
                                  ? AppTextStyles.font10WhiteRegular
                                  : AppTextStyles.font10GrayRegular,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              verticalSpace(10),
            ],
          );
        },
      ),
    );
  }
}
