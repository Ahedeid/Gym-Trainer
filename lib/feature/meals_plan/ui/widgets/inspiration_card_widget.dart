import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/feature/meals_plan/models/meal_plan_model.dart';
import 'package:gym_app/utils/extensions/sized_box.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';

class InspirationCardWidget extends StatelessWidget {
  final MealPlan? mealPlan;
  const InspirationCardWidget({Key? key, this.mealPlan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Hero(
            tag: mealPlan!,
            child: CachedNetworkImage(
              width: 80.w,
              height: 80.h,
              fit: BoxFit.cover,
              imageUrl: mealPlan!.image,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child:
                    CircularProgressIndicator(value: downloadProgress.progress),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
        20.addHorizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              2.addVerticalSpace,
              Text(
                mealPlan!.title,
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
                  Text(
                    "By ${mealPlan!.writeBy} ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: FontSize.s12.sp,
                    ),
                  ),
                ],
              ),
              4.addVerticalSpace,
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: double.parse(mealPlan!.rating),
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 16,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  Text(
                    "${mealPlan!.rating} ",
                    style: TextStyle(
                      color: ColorManager.subTitleText,
                      fontWeight: FontWeight.w500,
                      fontSize: FontSize.s14.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
