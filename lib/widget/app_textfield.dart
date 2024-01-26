import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jora_test/core/constants/app_colors.dart';
import 'package:jora_test/core/extension/dimension.extension.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool enabled;
  final bool isTextArea;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final bool isPassword;
  final String? errorMessage;
  final int? maxLength;
  final String? label;
  final String? placeholder;
  final Function(String?)? onChange;
  final String? regex;
  final BorderRadius? radius;
  const AppTextField(
      {super.key,
      this.controller,
      this.enabled = true,
      required this.isTextArea,
      this.label,
      this.placeholder,
      this.keyboardType = TextInputType.text,
      this.regex,
      this.onChange,
      this.isPassword = false,
      this.errorMessage,
      this.radius,
      this.maxLength,
      this.focusNode});

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    // RxString errMsg = widget.errorMessage ?? ''.obs;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: textTheme.labelSmall!.copyWith(
              fontSize: 14,
              color: AppColor.dark,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
        ],
        SizedBox(
          // height: widget.isPassword ? 40 : null,
          child: TextField(
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            obscureText: widget.isPassword && !visible,
            enabled: widget.enabled,
            // focusNode: FocusNode(),
            onTap: () {},
            maxLength: widget.maxLength,
            inputFormatters: widget.regex != null
                ? [
                    FilteringTextInputFormatter.allow(RegExp(widget.regex!)),
                  ]
                : null,
            onChanged: (value) {
              if (widget.onChange != null) {
                widget.onChange!(value);
                setState(() {});
              }
            },
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontSize: 14,
                ),
            minLines: (widget.isTextArea) ? 3 : 1,
            maxLines: (widget.isTextArea) ? null : 1,
            cursorHeight: 16,
            decoration: InputDecoration(
              isDense: true,
              counterText: '',
              suffixIcon: (widget.isPassword)
                  ? Icon(
                      visible ? Icons.visibility : Icons.visibility_off,
                      size: 14,
                      color: AppColor.iconColor,
                    ).onTap(() {
                      setState(() {
                        visible = !visible;
                      });
                    })
                  : null,
              // contentPadding: EdgeInsets.symmetric(
              //     horizontal: 12, vertical: widget.isPassword ? 12 : 16),
              hintText: widget.placeholder,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColor.grey_2,
                ),
                borderRadius: widget.radius ?? BorderRadius.circular(6),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: (widget.errorMessage ?? '').isNotEmpty
                      ? AppColor.danger
                      : AppColor.border,
                ),
                borderRadius: widget.radius ?? BorderRadius.circular(6),
              ),
            ),
          ),
        ),
        if ((widget.errorMessage ?? '').isNotEmpty)
          Obx(
            () => Align(
              alignment: Alignment.topLeft,
              child: Text(
                RxString(widget.errorMessage ?? '').value,
                style: TextStyle(
                  color: AppColor.danger,
                  fontFamily: textTheme.labelSmall!.fontFamily,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.clip,
              ),
            ),
          )
      ],
    );
  }
}
