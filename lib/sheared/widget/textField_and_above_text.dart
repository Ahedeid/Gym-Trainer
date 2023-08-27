import 'package:flutter/material.dart';
import 'package:gym_app/sheared/widget/custom_textFeild.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';


class TextFieldAndAboveText extends StatelessWidget {
  const TextFieldAndAboveText({
    super.key,
    required this.text,
    this.keyboardType = TextInputType.text,
    this.onChange,
    this.validator,
    this.obscureText = false,
    this.textInputAction,
    this.controller,
    this.suffixIcon,
    this.backGroundColor = ColorManager.white,
  });

  final String text;
  final TextInputType keyboardType;
  final Function? onChange;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Color? backGroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: FontSize.s14,
            color: ColorManager.primaryTextColor,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 8),
        CustomTextField(
          backGroundColor: backGroundColor,
          keyboardType: keyboardType,
          onChange: onChange,
          validator: validator,
          obscureText: obscureText,
          textInputAction: textInputAction,
          controller: controller,
          suffixIcon: suffixIcon ,
        ),
      ],
    );
  }
}
