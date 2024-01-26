import 'package:flutter/material.dart';
import 'package:jora_test/core/constants/app_colors.dart';

class PasswordPattern extends StatelessWidget {
  final bool value;
  final TextStyle style;
  final String text;
  const PasswordPattern(
      {super.key,
      required this.value,
      required this.style,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          value ? Icons.check_circle : Icons.cancel,
          color: value ? AppColor.success : AppColor.iconColor,
          size: 12,
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
          child: Text(
            text,
            style: style.copyWith(fontSize: 12, height: 1.0),
            overflow: TextOverflow.clip,
          ),
        )
      ],
    );
  }
}
