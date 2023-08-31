import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/feature/home_screen/models/exercise_model.dart';
import 'package:gym_app/sheared/widget/CustomeSvg.dart';
import 'package:gym_app/utils/extensions/sized_box.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';
import 'package:gym_app/utils/resources/icons_constant.dart';

import '../../../../utils/resources/strings_in_app.dart';

class VerticalExerciseWidget extends StatelessWidget {
  final ExerciseModel? exerciseModel;
  const VerticalExerciseWidget({
    this.exerciseModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        12.addVerticalSpace,
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Hero(
                  tag: exerciseModel!.id!,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    height: 155.h,
                    width: double.infinity,
                    imageUrl: exerciseModel!.image!,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Positioned(
                  right: 23,
                  top: 8,
                  child: Visibility(
                    visible: exerciseModel!.isFavorite!,
                    child: Container(
                      width: 30.width,
                      height: 30.height,
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: CustomSvgAssets(
                        width: 16.w,
                        height: 16.h,
                        color: ColorManager.hearColor,
                        path: AppIcons.like,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 23,
                  top: 8,
                  child: Visibility(
                    visible: exerciseModel!.isLocked!,
                    child: Container(
                      width: 30.width,
                      height: 30.height,
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.lock,
                        size: 15.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        15.addVerticalSpace,
        Text(
          "${exerciseModel?.title}",
          style: const TextStyle(
            color: ColorManager.subTitleText,
            fontWeight: FontWeight.w800,
            fontSize: FontSize.s14,
          ),
        ),
        10.addVerticalSpace,
        Row(
          children: [
            Text(
              "${exerciseModel!.levelDisplay.toString()}   ${AppStrings.oClock} ",
              style: const TextStyle(
                color: ColorManager.subTitleText,
                fontWeight: FontWeight.normal,
                fontSize: FontSize.s14,
              ),
            ),
            7.addHorizontalSpace,
            CustomSvgAssets(
              width: 16.w,
              height: 16.h,
              color: ColorManager.iconColor,
              path: AppIcons.time,
            ),
            Text(
              "${exerciseModel?.time} min",
              style: const TextStyle(
                color: ColorManager.subTitleText,
                fontWeight: FontWeight.normal,
                fontSize: FontSize.s14,
              ),
            ),
          ],
        ),
        12.addVerticalSpace,
      ],
    );
  }
}
