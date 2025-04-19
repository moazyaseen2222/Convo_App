import 'package:flutter/material.dart';

import '../theming/app_colors.dart';

class ConvoHeadLine extends StatelessWidget {
  const ConvoHeadLine({
    super.key,
    required this.textStyle,
  });

  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Convo', style: textStyle),
        Text('.', style: textStyle.copyWith(color: AppColors.mainBlue)),
      ],
    );
  }
}
