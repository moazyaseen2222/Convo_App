import 'package:convo_/core/helpers/app_regex.dart';
import 'package:convo_/features/auth/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_widgets/app_text_form_field.dart';
import '../../../../../core/helpers/spaces.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  void initState() {
    context.read<SignUpCubit>().emailController = TextEditingController();
    context.read<SignUpCubit>().passwordController = TextEditingController();
    context.read<SignUpCubit>().confirmPasswordController =
        TextEditingController();

    super.initState();
  }

  bool isObsecureTextPassword = true;
  bool isObsecureTextConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<SignUpCubit>().emailController,
            title: 'Enter Gmail',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'You Should Enter Email';
              } else if (!AppRegex.isValidEmail(value)) {
                return 'Not Valid Email';
              }
            },
          ),
          verticalSpace(20.h),
          AppTextFormField(
            isObsecureText: isObsecureTextPassword,
            controller: context.read<SignUpCubit>().passwordController,
            title: 'Enter Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'You Should Enter Password';
              } else if (!AppRegex.hasMinLength(value)) {
                return 'At least 6 Charectar';
              }
            },
            suffixIcon:
                isObsecureTextPassword
                    ? Icons.visibility_off
                    : Icons.visibility,
            suffixIconOnTap: () {
              setState(() {
                isObsecureTextPassword = !isObsecureTextPassword;
              });
            },
          ),
          verticalSpace(20.h),
          AppTextFormField(
            isObsecureText: isObsecureTextConfirmPassword,
            controller: context.read<SignUpCubit>().confirmPasswordController,
            title: 'Confirm Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Confirm the password';
              } else if (!AppRegex.hasMinLength(value)) {
                return 'At least 6 Charectar';
              } else if (value !=
                  context.read<SignUpCubit>().passwordController.text) {
                return 'Un Matched Passowrd !';
              }
            },
            suffixIcon:
                isObsecureTextConfirmPassword
                    ? Icons.visibility_off
                    : Icons.visibility,
            suffixIconOnTap: () {
              setState(() {
                isObsecureTextConfirmPassword = !isObsecureTextConfirmPassword;
              });
            },
          ),
        ],
      ),
    );
  }
}
