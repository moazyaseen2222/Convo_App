import 'package:convo_/core/theming/app_text_styles.dart';
import 'package:convo_/features/porfile/logic/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_ce/hive.dart';

class ImageNameBio extends StatelessWidget {
  const ImageNameBio({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('userDataBox');
    final String userName = box.get('userName');
    final String userBio = box.get('userBio');
    final String userStatus = box.get('userStatus');
    return Column(
      children: [
        // Profile Image
        Center(
          child: CircleAvatar(
            radius: 80.r,
            backgroundImage: NetworkImage(
              context.read<ProfileCubit>().imageUrl ??
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWpna26opFqFZ4n37v71IOXad4lk53w7o9KPqWF2JHrCfCG0Ft&s',
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Name
        Text(
          userName,
          //context.read<ProfileCubit>().name ?? 'fucking no name',
          // 'John Doe',
          style: AppTextStyles.font24ReguralBlue,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),

        // Bio
        Text(
          userBio,
          //context.read<ProfileCubit>().bio ?? 'fucking no bio',
          // 'Flutter Developer | Coffee Lover ☕',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 16),

        // Status
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color:
                context.read<ProfileCubit>().status == 'Busy'
                    ? Colors.red
                    : context.read<ProfileCubit>().status == 'Available'
                    ? Colors.green
                    : Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            userStatus,
            // context.read<ProfileCubit>().status ?? 'fucking no status',
            // 'Online',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
