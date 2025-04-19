import 'package:convo_/features/set_profile/logic/cubit/set_profile_cubit.dart';
import 'package:convo_/features/set_profile/ui/widgets/drop_down_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_widgets/app_text_form_field.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spaces.dart';
import 'bloc_consumer_with_set_button.dart';

class InfoForm extends StatefulWidget {
  const InfoForm({super.key});

  @override
  State<InfoForm> createState() => _InfoFormState();
}

class _InfoFormState extends State<InfoForm> {
  @override
  void initState() {
    context.read<SetInfoCubit>().nameController = TextEditingController();
    context.read<SetInfoCubit>().bioController = TextEditingController();
    // final name = context.read<SetProfileCubit>().getUserId();

    // print(' USER ID FROM SIGN UP :  $name');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SetInfoCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            title: 'Name',
            controller: context.read<SetInfoCubit>().nameController,
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
            controller: context.read<SetInfoCubit>().bioController,
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
          const BlocConsumerWithCompleteButton(),
        ],
      ),
    );
  }
}
