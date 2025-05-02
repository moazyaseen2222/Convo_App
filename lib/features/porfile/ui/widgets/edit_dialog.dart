import 'package:convo_/core/app_widgets/app_text_form_field.dart';
import 'package:convo_/core/helpers/app_regex.dart';
import 'package:convo_/core/theming/app_text_styles.dart';
import 'package:convo_/features/porfile/logic/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileDialog extends StatefulWidget {
  const EditProfileDialog({
    super.key,
    required this.nameController,
    required this.bioController,
  });

  final TextEditingController nameController;
  final TextEditingController bioController;

  @override
  State<EditProfileDialog> createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return AlertDialog(
      title: Text('Edit Profile', style: AppTextStyles.font13BlackBold),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextFormField(
              controller: widget.nameController,
              hint: 'Name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                } else if (!AppRegex.hasNameMinLength(value)) {
                  return 'At least 4 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            AppTextFormField(
              controller: widget.bioController,
              hint: 'Bio',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a bio';
                } else if (!AppRegex.hasNameMinLength(value)) {
                  return 'At least 4 characters';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
        TextButton(
          onPressed: () {
            // if (formKey.currentState!.validate()) {
            //   context.read<ProfileCubit>().updateProfile(
            //         name: nameController.text,
            //         bio: bioController.text,
            //       );
            //   Navigator.of(context).pop();
            // }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
