import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/utils/extensions/sized_box.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';
import 'package:gym_app/utils/resources/images_constant.dart';

class HorizontalExerciseWidget extends StatelessWidget {
  const HorizontalExerciseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            ImageApp.articleImage,
            width: 91.w,
            height: 91.h,
            fit: BoxFit.fill,
          ),
        ),
        20.addHorizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              2.addVerticalSpace,
              Text(
                "Exercises with Jumping Rope ddddsdsds",
                overflow: TextOverflow.visible,
                style: TextStyle(
                  color: ColorManager.subTitleText,
                  fontWeight: FontWeight.w800,
                  fontSize: FontSize.s12.sp,
                ),
              ),
              10.addVerticalSpace,
              Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.crisis_alert_sharp,
                        size: 14.sp,
                        color: ColorManager.iconColor,
                      ),
                      7.addHorizontalSpace,
                      Text(
                        "110 Kcal |",
                        style: TextStyle(
                          color: ColorManager.subTitleText,
                          fontWeight: FontWeight.normal,
                          fontSize: FontSize.s10.sp,
                        ),
                      ),
                    ],
                  ),
                  5.addHorizontalSpace,
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 14.sp,
                        color: ColorManager.iconColor,
                      ),
                      7.addHorizontalSpace,
                      Text(
                        "8 min",
                        style: TextStyle(
                          color: ColorManager.subTitleText,
                          fontWeight: FontWeight.normal,
                          fontSize: FontSize.s10.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              2.addVerticalSpace,
              Text(
                "Beginner",
                style: TextStyle(
                  color: ColorManager.subTitleText,
                  fontWeight: FontWeight.normal,
                  fontSize: FontSize.s10.sp,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
