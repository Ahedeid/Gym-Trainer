import 'package:flutter/material.dart';
import 'package:gym_app/sheared/widget/CustomSvg.dart';
import 'package:gym_app/sheared/widget/custom_textFeild.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar(
      {this.hintText = AppStrings.search,
      this.onChange,
      this.controller,
      Key? key})
      : super(key: key);
  final Function? onChange;
  final TextEditingController? controller;

  final String hintText;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        hintText: hintText,
        keyboardType: TextInputType.name,
        prefixIcon: const CustomSvgAssets(
            // path: AppIcons.search,
            ),
        controller: controller,
        onChange: onChange);
  }
}
