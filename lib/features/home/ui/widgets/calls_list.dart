import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_text_styles.dart';

class CallsList extends StatelessWidget {
  const CallsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 610.h,
        width: double.infinity,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 15.r,
                    backgroundImage: const AssetImage('images/person.png'),
                  ),
                  title: Text(
                    'User Name',
                    style: AppTextStyles.font13BlackBold,
                  ),
                  subtitle: Text(
                    'The Call end at 5:32 PM',
                    style: AppTextStyles.font12GrayRegular,
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.call,
                        size: 15,
                      )),
                ),
                Divider(
                  endIndent: 30.w,
                  indent: 30.w,
                  color: Colors.grey.shade200,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
