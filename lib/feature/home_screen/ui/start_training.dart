import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/feature/home_screen/models/exercise_model.dart';
import 'package:gym_app/feature/home_screen/providers/home_provider.dart';
import 'package:gym_app/feature/home_screen/ui/widgets/countdown.dart';
import 'package:gym_app/feature/home_screen/ui/widgets/horizontal_exercise_list_countdown.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/sheared/widget/CustomeSvg.dart';
import 'package:gym_app/utils/extensions/sized_box.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/icons_constant.dart';
import 'package:gym_app/utils/resources/style_manger.dart';
import 'package:provider/provider.dart';

class StartTraining extends StatefulWidget {
  final ExerciseModel? exerciseModel;

  const StartTraining({Key? key, this.exerciseModel}) : super(key: key);

  @override
  State<StartTraining> createState() => _StartTrainingState();
}

class _StartTrainingState extends State<StartTraining> {
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
        child: Consumer<HomeProvider>(
          builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: value.exerciseResult![value.currentIndex],
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      height: 419.h,
                      width: double.infinity,
                      imageUrl:
                          value.exerciseResult![value.currentIndex].image!,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                16.addVerticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Exercise ${value.currentIndex + 1} /${value.exerciseResult!.length}",
                    style: TextStyle(
                        color: ColorManager.subTitleText,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                5.addVerticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(value.exerciseResult![value.currentIndex].title!,
                      style: StyleManger.headLineBar()),
                ),
                20.addVerticalSpace,
                Center(
                  child: CircularCountDownTimer(
                    controller: value.countDownController,
                    duration: int.parse(
                            value.exerciseResult![value.currentIndex].time!) *
                        60,
                    isReverse: true,
                    height: 100,
                    width: 100,
                    initialDuration: int.parse(
                            value.exerciseResult![value.currentIndex].time!) *
                        60,
                    strokeWidth: 10,
                    fillColor: ColorManager.black,
                    onComplete: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Finished',
                          ),
                          behavior: SnackBarBehavior.floating,
                          duration: const Duration(seconds: 2),
                          backgroundColor: kblueColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      );
                    },
                    strokeCap: StrokeCap.round,
                    isReverseAnimation: true,
                    ringColor: ColorManager.greyButton,
                    autoStart: false,
                    textStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ),
                21.addVerticalSpace,
                Center(
                    child: Text(
                  "${int.parse(value.exerciseResult![value.currentIndex].time!)} min",
                  style: TextStyle(fontWeight: FontWeight.w700),
                )),
                20.addVerticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Visibility(
                      visible: value.countDownController.isStarted == true,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5)),
                        child: TextButton.icon(
                          onPressed: () {
                            value.platStop();
                          },
                          icon: Icon(
                            value.countDownController.isPaused
                                ? Icons.play_arrow
                                : Icons.pause,
                            color: Colors.black,
                          ),
                          label: Text(
                            value.countDownController.isPaused
                                ? "Resume"
                                : "Pause",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: !value.countDownController.isStarted == true,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5)),
                        child: TextButton.icon(
                          onPressed: () {
                            setState(() {});
                            value.countDownController.start();
                          },
                          icon: Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                          ),
                          label: Text(
                            "Start",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: BorderRadius.circular(5)),
                      child: TextButton.icon(
                        onPressed: () {
                          value.nextTarget();
                        },
                        icon: CustomSvgAssets(
                          path: AppIcons.person_run,
                        ),
                        label: Text(
                          "Next Training",
                          style: StyleManger.headLineBar(
                              color: Colors.white, fontSize: 22.sp),
                        ),
                      ),
                    ),
                  ],
                ),
                18.addVerticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Up Next ${value.upNextList?.length}",
                    style: TextStyle(
                        color: ColorManager.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                16.addVerticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: HorizontalExerciseListCountdown(
                      resultList: value.upNextList ?? []),
                ),
                20.addVerticalSpace,
              ],
            );
          },
        ),
      ),
    );
  }
}
