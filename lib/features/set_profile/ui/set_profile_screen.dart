import 'package:convo_/core/helpers/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'widgets/head_bar_row.dart';
import 'widgets/image_selectore.dart';
import 'widgets/info_form.dart';

class SetProfileScreen extends StatefulWidget {
  const SetProfileScreen({super.key});

  @override
  State<SetProfileScreen> createState() => _SetProfileScreenState();
}

class _SetProfileScreenState extends State<SetProfileScreen> {
  String? _imageUrl;
  final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Head Bar Row \\
                const HeadBarRow(),
                verticalSpace(50.h),

                // Image Selectore \\
                ImageSelectore(
                  imageUrl: _imageUrl,
                  onUpload: (String imageUrl) async {
                    setState(() {
                      _imageUrl = imageUrl;
                    });

                    final userId = supabase.auth.currentUser!.id;
                    await supabase
                        .from('usersimages')
                        .update({'imageUrl': imageUrl})
                        .eq('id', userId);
                  },
                ),
                verticalSpace(50.h),

                // Info Form \\
                const InfoForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
