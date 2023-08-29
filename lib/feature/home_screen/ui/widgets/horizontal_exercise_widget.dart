import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/feature/home_screen/models/exercise_model.dart';
import 'package:gym_app/utils/extensions/sized_box.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';

class HorizontalExerciseWidget extends StatelessWidget {
  final ExerciseModel? exerciseModel;
  const HorizontalExerciseWidget({
    this.exerciseModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            width: 80.w,
            height: 80.h,
            fit: BoxFit.cover,
            imageUrl: exerciseModel!.image!,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
              child:
                  CircularProgressIndicator(value: downloadProgress.progress),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        SizedBox(
          width: 15.width,
        ),
        // 20.addHorizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              2.addVerticalSpace,
              Text(
                exerciseModel!.title!,
                overflow: TextOverflow.visible,
                style: TextStyle(
                  color: ColorManager.subTitleText,
                  fontWeight: FontWeight.w800,
                  fontSize: FontSize.s14.sp,
                ),
              ),
              6.addVerticalSpace,
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
                        "${exerciseModel!.kal} |",
                        style: TextStyle(
                          color: ColorManager.subTitleText,
                          fontWeight: FontWeight.normal,
                          fontSize: FontSize.s14.sp,
                        ),
                      ),
                    ],
                  ),
                  7.addHorizontalSpace,
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 14.sp,
                        color: ColorManager.iconColor,
                      ),
                      7.addHorizontalSpace,
                      Text(
                        "${exerciseModel!.time}",
                        style: TextStyle(
                          color: ColorManager.subTitleText,
                          fontWeight: FontWeight.normal,
                          fontSize: FontSize.s14.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              2.addVerticalSpace,
              Text(
                "${exerciseModel!.levelDisplay}",
                style: TextStyle(
                  color: ColorManager.subTitleText,
                  fontWeight: FontWeight.normal,
                  fontSize: FontSize.s14.sp,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
