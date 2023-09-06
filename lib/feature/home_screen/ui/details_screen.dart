import 'package:flutter/material.dart';
import 'package:gym_app/sheared/widget/CustomSvg.dart';
import 'package:gym_app/sheared/widget/custom_appBar-secondary.dart';
import 'package:gym_app/sheared/widget/custom_button.dart';
import 'package:gym_app/sheared/widget/main_container.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';
import 'package:gym_app/utils/resources/icons_constant.dart';
import 'package:gym_app/utils/resources/images_constant.dart';
import 'package:gym_app/utils/resources/sizes_in_app.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';
import 'package:gym_app/utils/resources/style_manger.dart';

// import 'package:table_calendar_jalali/table_calendar_jalali.dart';

class ClassDetailsScreen extends StatefulWidget {
  const ClassDetailsScreen({super.key});

  @override
  State<ClassDetailsScreen> createState() => _ClassDetailsScreenState();
}

class _ClassDetailsScreenState extends State<ClassDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarSecondary(
        title: AppStrings.bodyBalance,
        showSubTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingHorizontal,
          vertical: AppSizes.paddingVertical,
        ),
        children: [
          Stack(
            children: [
              Image.asset(
                ImageApp.articleImage,
                fit: BoxFit.fill,
                width: double.infinity,
                // height: 190,
              ),
              Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    width: 116,
                    height: 22,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ColorManager.secondary200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      AppStrings.mindBody,
                      style: StyleManger.headline4(
                        fontSize: FontSize.s12,
                        color: ColorManager.secondary,
                      ),
                    ),
                  )),
              Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    width: 65,
                    height: 22,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ColorManager.backGroundGreen,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      AppStrings.free,
                      style: StyleManger.headline3(
                        fontSize: FontSize.s12,
                        color: ColorManager.greenText,
                      ),
                    ),
                  )),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Row(
                children: [
                  const Text(
                    '🙅🏻‍♂️',
                    style: TextStyle(fontSize: 29),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ahed Eid',
                          style: StyleManger.headline4(
                            fontSize: 12,
                            color: ColorManager.primaryTextColor,
                          )),
                      const SizedBox(height: 7),
                      Text(AppStrings.trainer,
                          style: StyleManger.headline4(
                              fontSize: 12,
                              color: ColorManager.secondaryTextColor)),
                    ],
                  )
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  CustomSvgAssets(
                    path: AppIcons.level,
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStrings.hard,
                          style: StyleManger.headline4(
                            fontSize: 12,
                            color: ColorManager.secondary,
                          )),
                      const SizedBox(height: 7),
                      Text(AppStrings.intensity,
                          style: StyleManger.headline4(
                              fontSize: 12,
                              color: ColorManager.secondaryTextColor)),
                    ],
                  )
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  const Text(
                    '⌛',
                    style: TextStyle(fontSize: 29),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('15 mins',
                          style: StyleManger.headline4(
                            fontSize: 12,
                            color: const Color(0xFF0062A0),
                          )),
                      const SizedBox(height: 7),
                      Text(AppStrings.duration,
                          style: StyleManger.headline4(
                              fontSize: 12,
                              color: ColorManager.secondaryTextColor)),
                    ],
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(AppStrings.location,
              style: StyleManger.headline2(fontSize: FontSize.s18)),
          const SizedBox(height: 8),
          Text(
              'Shahid street - Next to Arjan signs Carrefour complex, 4th floor Amman,Jordan',
              style: StyleManger.bodyText2()),
          const SizedBox(height: 16),
          Text(AppStrings.availableDates,
              style: StyleManger.headline2(fontSize: FontSize.s18)),
          const SizedBox(height: 12),
          MainContainer(
            height: 82,
            color: ColorManager.white,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              padding: const EdgeInsets.symmetric(vertical: 4),
              itemBuilder: (context, index) => MainContainer(
                  color: index == 1 || index == 3 || index == 5
                      ? Colors.grey.shade100
                      : ColorManager.secondary,
                  right: 4,
                  left: 4,
                  horizontal: 8,
                  vertical: 15,
                  child: Column(
                    children: [
                      Text('13 May',
                          style: StyleManger.bodyText2(
                              color: ColorManager.primaryTextColor)),
                      const SizedBox(height: 4),
                      Text('Sat',
                          style: StyleManger.bodyText2(
                              color: ColorManager.primaryTextColor)),
                    ],
                  )),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.only(left: 10),
            decoration: const BoxDecoration(
                border: Border(
              left: BorderSide(width: 3, color: Color(0xFFE29835)),
            )),
            child: Text(
              'This self defence class for adults is predominantly Jiu-jitsu based.\nThe skills help improve self discipline, agility and of course fitness.\nSuitable for beginners to black belts, with regular grading sessions throughout the year.',
              style: StyleManger.headline4(),
            ),
          ),
          // JalaliTableCalendar(
          //   currentMonth: Jalali.now(),
          //   headerStyle: TextStyle(color: Colors.blue),
          //   weekDaysStyle: TextStyle(fontSize: 12),
          //   selectedDay: selectedDate,
          //   dayBuilder: (context, date) {
          //     // Custom day builder implementation
          //     return Container(
          //       margin: EdgeInsets.all(5),
          //       decoration: BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.circular(10)),
          //       child: Center(
          //         child: Text(
          //           date.day.toString().toFarsiNumber(),
          //           style: TextStyle(fontSize: 16),
          //         ),
          //       ),
          //     );
          //   },
          //   onDaySelected: (date) {
          //     // Handle day selection
          //     print('Selected date: $date');
          //     setState(() {
          //       selectedDate = date;
          //     });
          //   },
          //   headerText: (date) {
          //     // Custom header text implementation
          //     return '${date.formatter.mN} ${date.year}'.toFarsiNumber();
          //   },
          //   onMonthChanged: (date) {
          //     // Handle month change
          //     print('Current month: $date');
          //   },
          // ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MainContainer(
        width: double.infinity,
        color: ColorManager.white,
        horizontal: AppSizes.paddingHorizontal,
        child: CustomButtonWidget(
          title: AppStrings.bookNow,
          onPressed: () {},
        ),
      ),
    );
  }
}
