import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/feature/home_screen/models/exercise_model.dart';
import 'package:gym_app/sheared/widget/CustomSvg.dart';
import 'package:gym_app/utils/extensions/sized_box.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';
import 'package:gym_app/utils/resources/icons_constant.dart';

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
          child: Hero(
            tag: exerciseModel!,
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
                exerciseModel!.title!.tr(),
                overflow: TextOverflow.visible,
                style: TextStyle(
                  color: ColorManager.subTitleText,
                  fontWeight: FontWeight.w600,
                  fontSize: FontSize.s14,
                ),
              ),
              6.addVerticalSpace,
              Row(
                children: [
                  Row(
                    children: [
                      CustomSvgAssets(
                        // size: 14.sp,
                        width: 14.w,
                        height: 14.h,
                        color: ColorManager.iconColor,
                        path: AppIcons.kal,
                      ),
                      4.addHorizontalSpace,
                      Text(
                        "${exerciseModel!.kal} |",
                        style: TextStyle(
                          color: ColorManager.subTitleText,
                          fontWeight: FontWeight.normal,
                          fontSize: FontSize.s12.sp,
                        ),
                      ),
                    ],
                  ),
                  4.addHorizontalSpace,
                  Row(
                    children: [
                      CustomSvgAssets(
                        width: 16.w,
                        height: 16.h,
                        color: ColorManager.iconColor,
                        path: AppIcons.time,
                      ),
                      4.addHorizontalSpace,
                      Text(
                        "${exerciseModel!.time} min",
                        style: TextStyle(
                          color: ColorManager.subTitleText,
                          fontWeight: FontWeight.normal,
                          fontSize: FontSize.s12.sp,
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
                  fontSize: FontSize.s12.sp,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
