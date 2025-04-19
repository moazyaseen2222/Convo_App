import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            endIndent: 10.w,
            indent: 10.w,
          ),
        ),
        const Text('or'),
        Expanded(
          child: Divider(
            endIndent: 10.w,
            indent: 10.w,
          ),
        ),
      ],
    );
  }
}
