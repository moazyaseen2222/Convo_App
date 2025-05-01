import 'package:convo_/core/app_widgets/app_text_form_field.dart';
import 'package:convo_/core/helpers/app_regex.dart';
import 'package:convo_/features/porfile/logic/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditDialog extends StatelessWidget {
  const EditDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit, color: Colors.white),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Edit Profile'),
              content: Column(
                children: [
                  AppTextFormField(
                    controller: context.read<ProfileCubit>().nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'You Should Enter Name';
                      } else if (!AppRegex.hasNameMinLength(value)) {
                        return 'At least 4 Charectar';
                      }
                    },
                  ),
                  AppTextFormField(
                    controller: context.read<ProfileCubit>().bioController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'You Should Enter Bio';
                      } else if (!AppRegex.hasNameMinLength(value)) {
                        return 'At least 4 Charectar';
                      }
                    },
                  ),
                ],
              ),

              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
