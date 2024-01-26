import 'package:jora_test/core/constants/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.transparent,
      child: Center(
        child: LoadingAnimationWidget.beat(
          color: AppColor.primary,
          size: 50,
        ),
      ),
    );
  }
}
