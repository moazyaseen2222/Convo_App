import 'package:convo_/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/app_widgets/app_text_form_field.dart';
import '../../../../../core/helpers/app_regex.dart';
import '../../../../../core/helpers/spaces.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  void initState() {
    context.read<LoginCubit>().emailController = TextEditingController();
    context.read<LoginCubit>().passwordControlle = TextEditingController();
    super.initState();
  }

  bool isObsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<LoginCubit>().emailController,
            title: 'Enter Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'You Should Enter Email';
              } else if (!AppRegex.isValidEmail(value)) {
                return 'Not valid Email';
              }
            },
          ),
          verticalSpace(20),
          AppTextFormField(
            isObsecureText: isObsecureText,
            controller: context.read<LoginCubit>().passwordControlle,
            title: 'Enter Password',
            suffixIcon:
                isObsecureText ? Icons.visibility_off : Icons.visibility,
            suffixIconOnTap: () {
              setState(() {
                isObsecureText = !isObsecureText;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'You Should Enter Password';
              } else if (!AppRegex.hasMinLength(value)) {
                return 'At least 6 charectar';
              }
            },
          ),
        ],
      ),
    );
  }
}
