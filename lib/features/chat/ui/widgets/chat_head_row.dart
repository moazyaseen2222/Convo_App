import 'package:convo_/core/theming/app_colors.dart';
import 'package:convo_/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChatHeadRow extends StatelessWidget {
  const ChatHeadRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // back button
        const BackButton(color: AppColors.mainBlue),

        // Cantant Name
        Text('Contant Name', style: AppTextStyles.font16BoldTextColor),

        //Contant Image
        const CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('images/person.png'),
        ),
      ],
    );
  }
}
