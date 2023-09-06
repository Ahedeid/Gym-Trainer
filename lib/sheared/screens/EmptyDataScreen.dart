import 'package:flutter/material.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';
import 'package:gym_app/utils/resources/images_constant.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';

class ToEmptyDataWidget extends StatelessWidget {
  const ToEmptyDataWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImageApp.logo,
            color: Colors.white,
            width: 100,
            height: 100,
          ),
          Text(
            AppStrings.technoGym,
            style:
                TextStyle(fontSize: FontSize.s26, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              fontSize: FontSize.s18,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: FontSize.s14, color: ColorManager.secondaryTextColor),
          ),
        ],
      ),
    );
  }
}
