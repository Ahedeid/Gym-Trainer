import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/feature/home_screen/models/exercise_model.dart';
import 'package:gym_app/feature/home_screen/providers/home_provider.dart';
import 'package:gym_app/feature/home_screen/ui/widgets/header_section_widget.dart';
import 'package:gym_app/feature/home_screen/ui/widgets/horizontal_exercise_list.dart';
import 'package:gym_app/logic/firebase_constant.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/sheared/widget/CustomeSvg.dart';
import 'package:gym_app/sheared/widget/bottomSheetDedailsWidget.dart';
import 'package:gym_app/sheared/widget/customAppBar.dart';
import 'package:gym_app/utils/extensions/sized_box.dart';
import 'package:gym_app/utils/helper.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/icons_constant.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';
import 'package:gym_app/utils/resources/style_manger.dart';
import 'package:provider/provider.dart';

class ExerciseDetails extends StatelessWidget {
  final ExerciseModel? exerciseModel;

  const ExerciseDetails({Key? key, this.exerciseModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffoldColor,
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Consumer<HomeProvider>(
          builder: (context, value, child) => ElevatedButton(
            onPressed: () {
              value.setTrainingExercise(exerciseModel!);

              sl<AppRouter>().goTo(
                  screenName: ScreenName.startTraining,
                  object: value.trainingExerciseModel);
            },
            child: Text(AppStrings.startTraining,
                style: StyleManger.headLineBar(color: ColorManager.white)),
            style: ElevatedButton.styleFrom(
                textStyle: StyleManger.headLineBar(color: ColorManager.white)),
          ),
        ),
      ),
      appBar: CustomAppBar(
        title: '',
        visible: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 410,
              child: Stack(
                children: [
                  Hero(
                    tag: exerciseModel!,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      height: 380,
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
                      bottom: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 60,
                          width: 320.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  topLeft: Radius.circular(15))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  CustomSvgAssets(
                                    width: 17.78,
                                    height: 22.44,
                                    color: Colors.black,
                                    path: AppIcons.kal_m,
                                  ),
                                  5.addHorizontalSpace,
                                  Text(
                                    "${exerciseModel!.kal} Kal",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Text(
                                "|",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal),
                              ),
                              Row(
                                children: [
                                  CustomSvgAssets(
                                    width: 17.78,
                                    height: 22.44,
                                    color: Colors.black,
                                    path: AppIcons.time_m,
                                  ),
                                  5.addHorizontalSpace,
                                  Text(
                                    "${exerciseModel!.time} min",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
            10.addVerticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Consumer<HomeProvider>(
                builder: (context, value, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Details(
                        title: AppStrings.level,
                        body: exerciseModel?.levelDisplay,
                      ),
                    ),
                    Expanded(
                      child: Details(
                        title: AppStrings.category,
                        body: "${value.categoryModel?.name ?? "Not Specified"}",
                      ),
                    ),
                    Expanded(
                      child: Details(
                        title: AppStrings.weight,
                        body: "${value.goalModel?.name}",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.addVerticalSpace,
                  Text(
                    "${exerciseModel!.title}",
                    style: StyleManger.headLineBar(),
                  ),
                  9.addVerticalSpace,
                  Text(
                    "${exerciseModel!.description}",
                    style: TextStyle(
                        color: ColorManager.subTitleDetailsColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp),
                  ),
                  34.addVerticalSpace,
                  Consumer(
                    builder: (context, HomeProvider value, child) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "3 ${AppStrings.weeks} - ${value.ExerciseDetailsList!.length} ${AppStrings.exercise}",
                          style: TextStyle(
                              color: ColorManager.textBlack,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp),
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                useSafeArea: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                context: context,
                                builder: (context) => BottomSheetDetailsWidget());
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 23, vertical: 12),
                            child: Text(
                              AppStrings.schedule,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.white),
                            ),
                            decoration: BoxDecoration(
                                color: ColorManager.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                        )
                      ],
                    ),
                  ),
                  32.addVerticalSpace,
                  HeaderSectionWidget(
                    title: AppStrings.exerciseProgram,
                    trailing: "",
                  ),
                  20.addVerticalSpace,
                  Consumer<HomeProvider>(
                    builder: (context, homeProvider, child) =>
                        StreamBuilder<QuerySnapshot>(
                      stream: sl<FirebaseFirestore>()
                          .collection(FirebaseConstant.exercisesCollection)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        final categoryDocs = snapshot.data!.docs;
                        final resultList = homeProvider.filterExerciseByGoal(
                            categoryDocs, homeProvider.goalModel?.id);

                        final passList = homeProvider.filterExerciseByGoal(
                            categoryDocs, homeProvider.goalModel?.id);
                        ;
                        homeProvider.setExerciseList(passList);
                        resultList.removeWhere(
                            (element) => exerciseModel!.id == element.id);
                        return HorizontalExerciseList(resultList: resultList);
                      },
                    ),
                  ),
                  100.addVerticalSpace,
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
  final String? title;
  final String? body;
  final bool showTitle;

  const Details({Key? key, this.title, this.body, this.showTitle = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Visibility(
            visible: showTitle,
            child: Text(
              title!,
              style: TextStyle(
                  fontSize: 12.sp, color: ColorManager.subTitleDetailsColor),
            ),
          ),
          6.addVerticalSpace,
          Container(
            width: 200,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Text(
              body!,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
            ),
            decoration: BoxDecoration(
                color: ColorManager.greyButton,
                borderRadius: BorderRadius.all(Radius.circular(5))),
          )
        ],
      ),
    );
  }
}
