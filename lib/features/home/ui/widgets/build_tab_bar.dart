import '../../../../core/helpers/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'calls_list.dart';
import 'chats_list.dart';

class BuildTabBarAndViews extends StatefulWidget {
  const BuildTabBarAndViews({
    super.key,
  });

  @override
  State<BuildTabBarAndViews> createState() => _BuildTabBarAndViewsState();
}

class _BuildTabBarAndViewsState extends State<BuildTabBarAndViews>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(15.r)),
          child: TabBar(
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
                border: Border.all(width: 3.w, color: Colors.transparent),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 1,
                      spreadRadius: 1)
                ],
                borderRadius: BorderRadius.circular(15.r)),
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            controller: tabController,
            tabs: const [Tab(text: 'Chats'), Tab(text: 'Calls')],
          ),
        ),
        verticalSpace(5),
        SizedBox(
          width: double.infinity,
          height: 610.h,
          child: TabBarView(
            controller: tabController,
            children: const [
              // Chats list widget
              ChatsList(),

              // Calls list widget
              CallsList(),
              
              
            ],
          ),
        ),
      ],
    );
  }
}
