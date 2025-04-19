import 'package:convo_/core/helpers/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/build_tab_bar.dart';
import 'widgets/head_row.dart';
import 'widgets/my_floating_action_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Column(
            children: [
              // Head Row \\
              const HeadRow(),
              verticalSpace(20),

              // Tab Bar \\
              const BuildTabBarAndViews(),
            ],
          ),
        ),
      ),
      // Floating Button \\
      floatingActionButton: const MyFloatingActionButton(),
    );
  }
}
