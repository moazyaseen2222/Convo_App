import 'package:convo_/core/helpers/spaces.dart';
import 'package:convo_/core/theming/app_text_styles.dart';
import 'package:convo_/features/porfile/logic/cubit/profile_cubit.dart';
import 'package:convo_/features/set_profile/logic/cubit/set_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(75, 191, 178, 178),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        child: DropdownButton<String>(
          borderRadius: BorderRadius.circular(10.r),
          dropdownColor: Colors.white,
          underline: const SizedBox(),
          isExpanded: true,
          value: selectedValue,
          hint: Text(
            'What`s your preferd status?',
            style: AppTextStyles.font13BlackRegular,
          ),
          items:
              <String>['Available', 'Busy', 'Offline'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 7.r,
                        backgroundColor:
                            value == 'Available'
                                ? Colors.green
                                : value == 'Busy'
                                ? Colors.red
                                : Colors.grey,
                      ),
                      horiznetlSpace(5.w),
                      Text(value, style: AppTextStyles.font13BlackRegular),
                    ],
                  ),
                );
              }).toList(),
          onChanged: (String? value) {
            setState(() {
              selectedValue = value;
              context.read<ProfileCubit>().userStatus =
                  value ?? context.read<SetInfoCubit>().userStatus;
            });
          },
        ),
      ),
    );
  }
}
