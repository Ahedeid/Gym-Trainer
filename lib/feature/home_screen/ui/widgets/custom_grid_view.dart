import 'package:flutter/material.dart';
import 'package:gym_app/sheared/widget/main_container.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';
import 'package:gym_app/utils/resources/sizes_in_app.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    required this.subTitle,
    required this.text,
    required this.title,
    required this.image,
    this.fontWeightToText = FontWeight.w300,
    super.key,
  });

  final String title;
  final String subTitle;
  final String text;
  final String image;
  final FontWeight fontWeightToText;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 4,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisExtent: 236,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15),
      itemBuilder: (context, index) {
        return MainContainer(
          vertical: AppSizes.paddingContainer,
          color: ColorManager.white,
          horizontal: AppSize.s12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(image),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(
                  color: ColorManager.primaryTextColor,
                  fontWeight: FontWeight.w800,
                  fontSize: FontSize.s14,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subTitle,
                style: const TextStyle(
                  color: ColorManager.primaryTextColor,
                  fontWeight: FontWeight.w300,
                  fontSize: FontSize.s14,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                text,
                style: TextStyle(
                  color: ColorManager.primaryTextColor,
                  fontWeight: fontWeightToText,
                  fontSize: FontSize.s14,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
