import 'package:convo_/features/porfile/logic/cubit/profile_cubit.dart';
import 'package:convo_/features/porfile/ui/widgets/bloc_consumer_with_save_button.dart';
import 'package:convo_/features/set_profile/ui/widgets/drop_down_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_widgets/app_text_form_field.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spaces.dart';

class EditInfoForm extends StatefulWidget {
  const EditInfoForm({super.key});

  @override
  State<EditInfoForm> createState() => _EditInfoFormState();
}

class _EditInfoFormState extends State<EditInfoForm> {
  @override
  void initState() {
    context.read<ProfileCubit>().nameController;
    context.read<ProfileCubit>().bioController;
    // final name = context.read<SetProfileCubit>().getUserId();

    // print(' USER ID FROM SIGN UP :  $name');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ProfileCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            title: 'Name',
            controller: context.read<ProfileCubit>().nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'You Should Enter Name';
              } else if (!AppRegex.hasNameMinLength(value)) {
                return 'At least 4 Charectar';
              }
            },
          ),
          verticalSpace(20.h),
          AppTextFormField(
            title: 'Bio',
            initialValue: '',
            controller: context.read<ProfileCubit>().bioController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'You Should Enter Bio';
              } else if (!AppRegex.hasNameMinLength(value)) {
                return 'At least 4 Charectar';
              }
            },
          ),
          verticalSpace(20.h),
          const DropDownWidget(),
          verticalSpace(50.h),
          const BlocConsumerWithSaveButton(),
        ],
      ),
    );
  }
}
