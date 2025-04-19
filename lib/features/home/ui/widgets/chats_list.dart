import 'package:convo_/core/helpers/extensions.dart';
import 'package:convo_/core/routing/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_text_styles.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 610.h,
        width: double.infinity,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 100,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    context.pushNamed(Routes.chatScreen);
                  },
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('images/person.png'),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('User Name', style: AppTextStyles.font13BlackBold),
                        Text(
                          '2min ago',
                          style: AppTextStyles.font10GrayRegular,
                        ),
                      ],
                    ),
                    subtitle: Text(
                      'Last message from the chat',
                      style: AppTextStyles.font12GrayRegular,
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 15,
                      ),
                    ),
                  ),
                ),
                Divider(
                  endIndent: 30.w,
                  indent: 30.w,
                  color: Colors.grey.shade200,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
