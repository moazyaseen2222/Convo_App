import 'package:convo_/core/helpers/spaces.dart';
import 'package:convo_/core/theming/app_text_styles.dart';
import 'package:convo_/features/porfile/logic/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageNameBio extends StatefulWidget {
  const ImageNameBio({super.key});

  @override
  State<ImageNameBio> createState() => _ImageNameBioState();
}

class _ImageNameBioState extends State<ImageNameBio> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        verticalSpace(16),
        // Name
        Text(
          context.read<ProfileCubit>().name ?? 'fucking no name',
          // 'John Doe',
          style: AppTextStyles.font24ReguralBlue,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),

        // Bio
        Text(
          context.read<ProfileCubit>().bio ?? 'fucking no bio',
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
            context.read<ProfileCubit>().status ?? 'fucking no status',
            // 'Online',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
