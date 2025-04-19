import 'package:convo_/core/helpers/extensions.dart';
import 'package:convo_/core/routing/routers.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/theming/app_colors.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.mainBlue,
      child: const Icon(Icons.chat_outlined, color: Colors.white),
      onPressed: () async {
        await Supabase.instance.client.auth.signOut();
        // ignore: use_build_context_synchronously
        context.pushReplacementNamed(Routes.authGate);
      },
    );
  }
}
