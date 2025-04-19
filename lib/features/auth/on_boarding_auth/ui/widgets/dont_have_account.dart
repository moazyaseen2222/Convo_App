import 'package:convo_/core/helpers/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routing/routers.dart';
import '../../../../../core/theming/app_text_styles.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have account? ',
            style: AppTextStyles.font13GrayRegular,
          ),
          TextSpan(
            text: 'Create one',
            style: AppTextStyles.font13BlueSemiBold,
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    context.pushReplacementNamed(Routes.signupScreen);
                  },
          ),
        ],
      ),
    );
  }
}
