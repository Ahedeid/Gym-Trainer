import 'package:flutter/material.dart';
import 'package:gym_app/sheared/widget/CustomeSvg.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/icons_constant.dart';


class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    required this.title,
    required this.onPressed,
    super.key,
    this.textColor = ColorManager.white,
    this.isLoading = false,
    this.showIcon = false,
    this.fontSize = 16,
    this.fontWeight,
    this.style,
  });

  final void Function() onPressed;
  final String title;
  final Color textColor;
  final bool isLoading;
  final bool showIcon;
  final double fontSize;
  final FontWeight? fontWeight;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style,
      onPressed: isLoading ? () {} : onPressed,
      child: isLoading == true
          ? const Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(color: Colors.white),
              ),
            )
          : showIcon
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: fontSize,
                          color: textColor,
                          fontWeight: fontWeight),
                    ),
                    CustomSvgAssets(
                      path: AppIcons.arrowNext,
                      color: ColorManager.primary,
                    ),
                  ],
                )
              : Text(
                  title,
                  style: TextStyle(
                      fontSize: fontSize,
                      color: textColor,
                      fontWeight: fontWeight),
                ),
    );
  }
}
