import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/feature/home_screen/providers/home_provider.dart';
import 'package:gym_app/feature/home_screen/ui/widgets/header_section_widget.dart';
import 'package:gym_app/feature/meals_plan/models/meal_plan_model.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/sheared/widget/CustomSvg.dart';
import 'package:gym_app/utils/extensions/sized_box.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/icons_constant.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';
import 'package:gym_app/utils/resources/style_manger.dart';
import 'package:provider/provider.dart';

class MealPlanDetails extends StatelessWidget {
  final MealPlan? mealPlan;

  const MealPlanDetails({Key? key, this.mealPlan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffoldColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              sl<AppRouter>().back();
            },
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 400,
              child: Stack(
                children: [
                  Hero(
                    tag: mealPlan!,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      height: 380,
                      width: double.infinity,
                      imageUrl: mealPlan!.image,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${mealPlan!.title}",
                    style: StyleManger.headLineBar(),
                  ),
                  8.addVerticalSpace,
                  Text(
                    "By ${mealPlan!.writeBy}",
                    style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                  ),
                ],
              ),
            ),
            12.addVerticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Consumer<HomeProvider>(
                builder: (context, value, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Details(
                        iconColor: ColorManager.customGreenDark,
                        circleColors: ColorManager.customGreenLight,
                        iconPath: AppIcons.time_m,
                        body: mealPlan!.time + "Min",
                      ),
                    ),
                    Expanded(
                      child: Details(
                        iconColor: ColorManager.customOrangeDark,
                        circleColors: ColorManager.customOrangeLight,
                        iconPath: AppIcons.kal_m,
                        body: "${mealPlan!.kcal} Kcal",
                      ),
                    ),
                    Expanded(
                      child: Details(
                        iconColor: ColorManager.customYellowDark,
                        circleColors: ColorManager.customYellowLight,
                        iconPath: AppIcons.time,
                        body: "${mealPlan!.rating}",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            20.addVerticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderSectionWidget(
                    title: AppStrings.description,
                    trailing: "",
                  ),
                  10.addVerticalSpace,
                  Text(
                    "${mealPlan?.description}",
                    style: TextStyle(
                        color: ColorManager.subTitleDetailsColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Details extends StatelessWidget {
  final String? iconPath;
  final String? body;
  final Color? circleColors;
  final Color? iconColor;

  const Details(
      {Key? key, this.iconPath, this.body, this.circleColors, this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          width: 150,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: circleColors!,
                child: CustomSvgAssets(
                  width: 50,
                  height: 50,
                  path: iconPath,
                  color: iconColor,
                ),
              ),
              16.addVerticalSpace,
              Text(
                body!,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.all(Radius.circular(5))),
        ),
      ),
    );
  }
}
