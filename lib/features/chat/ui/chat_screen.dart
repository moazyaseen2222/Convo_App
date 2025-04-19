import 'package:convo_/core/helpers/spaces.dart';
import 'package:convo_/features/chat/ui/widgets/chat_head_row.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/scrollable_chat.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Head Row
                const ChatHeadRow(),
                // verticalSpace(20),

                // Scrollable Chat
                const ScrollableChat(),
                verticalSpace(10),

                // Bottom Input Tools
                //  BottomInputTools(),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: BottomInputTools(),
    );
  }
}
