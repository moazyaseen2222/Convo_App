import 'package:convo_/core/theming/app_colors.dart';
import 'package:convo_/core/theming/app_text_styles.dart';
import 'package:convo_/features/porfile/logic/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    context.read<ProfileCubit>().fetchUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainBlue,
        centerTitle: true,
        title: Text('My Profile', style: AppTextStyles.font20RegularWhite),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              // Edit action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: AppColors.mainBlue,
                ),
              );
            } else if (state is ProfileSucess) {
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color:
                          context.read<ProfileCubit>().status == 'Busy'
                              ? Colors.red
                              : context.read<ProfileCubit>().status ==
                                  'Available'
                              ? Colors.green
                              : Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      context.read<ProfileCubit>().status ??
                          'fucking no status',
                      // 'Online',
                      style: TextStyle(
                        color: Colors.white,

                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is ProfilError) {
              return Center(
                child: Container(
                  height: 80.h,
                  width: 100.w,
                  color: Colors.grey,
                  child: Center(
                    child: Text(
                      'Error : ${state.message}',
                      style: AppTextStyles.font13WhiteSemiBold,
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: AppColors.mainBlue,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
