import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' as utilsSize;
import 'package:gym_app/feature/home_screen/models/categorie_model.dart';
import 'package:gym_app/feature/home_screen/providers/home_provider.dart';
import 'package:gym_app/feature/home_screen/ui/widgets/category_List_Widget.dart';
import 'package:gym_app/feature/home_screen/ui/widgets/goal_list.dart';
import 'package:gym_app/feature/home_screen/ui/widgets/header_section_widget.dart';
import 'package:gym_app/feature/home_screen/ui/widgets/horizontal_exercise_list.dart';
import 'package:gym_app/feature/home_screen/ui/widgets/vertical_exercise_list.dart';
import 'package:gym_app/logic/firebase_constant.dart';
import 'package:gym_app/logic/localData/shared_pref.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/sheared/widget/CustomeSvg.dart';
import 'package:gym_app/utils/extensions/sized_box.dart';
import 'package:gym_app/utils/extensions/string_extension.dart';
import 'package:gym_app/utils/extensions/time_of_day.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';
import 'package:gym_app/utils/resources/icons_constant.dart';
import 'package:gym_app/utils/resources/images_constant.dart';
import 'package:gym_app/utils/resources/sizes_in_app.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';
import 'package:gym_app/utils/resources/style_manger.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  List<CategoryModel>? resultList;

  @override
  Widget build(BuildContext context) {
    final currentTime = TimeOfDay.now();
    final greeting = currentTime.getGreeting();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: AppBarBody(greeting: greeting),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 42,
              height: 42,
              child: CustomSvgAssets(
                path: AppIcons.search,
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 42,
              height: 42,
              margin: const EdgeInsets.only(left: 8, right: 33),
              child: CustomSvgAssets(
                path: AppIcons.notification,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          return ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.paddingHorizontal,
              vertical: AppSizes.paddingVertical,
            ),
            children: [
              HeaderSectionWidget(
                onTap: () {},
                title: AppStrings.selectGoal,
                trailing: "",
              ),
              13.addVerticalSpace,
              SizedBox(
                  height: 35,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: sl<FirebaseFirestore>()
                        .collection(FirebaseConstant.goalsCollection)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return GoalList(
                        snapshot: snapshot,
                      );
                    },
                  )),
              20.addVerticalSpace,
              HeaderSectionWidget(
                onTap: () {
                  sl<AppRouter>().goTo(
                      screenName: ScreenName.allCategoryScreen,
                      object: resultList);
                },
                title: AppStrings.category,
                trailing: AppStrings.seeAll,
              ),
              15.addVerticalSpace,
              homeProvider.selectedGoalIdList == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : homeProvider.goalModel == null
                      ? Center(
                          child: SizedBox.shrink(),
                        )
                      : SizedBox(
                          height: 120.h,
                          child: StreamBuilder<QuerySnapshot>(
                            stream: sl<FirebaseFirestore>()
                                .collection(
                                    FirebaseConstant.categoriesCollection)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              final categoryDocs = snapshot.data!.docs;
                              resultList = homeProvider.filterCategoriesByGoal(
                                  categoryDocs,
                                  homeProvider.goalModel!.categorieList!);

                              return CategoryListWidget(
                                categoryList: resultList!,
                              );
                            },
                          ),
                        ),
              Divider(
                height: 1,
              ),
              16.addVerticalSpace,
              HeaderSectionWidget(
                onTap: () {},
                title: AppStrings.popularExercise,
                trailing: AppStrings.seeAll,
              ),
              10.addVerticalSpace,
              StreamBuilder<QuerySnapshot>(
                stream: sl<FirebaseFirestore>()
                    .collection(FirebaseConstant.exercisesCollection)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final categoryDocs = snapshot.data!.docs;
                  final resultList = homeProvider.filterExerciseByGoal(
                      categoryDocs, homeProvider.goalModel?.id);

                  return VerticalExerciseList(resultList: resultList);
                },
              ),
              Divider(),
              10.addVerticalSpace,
              HeaderSectionWidget(
                onTap: () {},
                title: AppStrings.additionalExercise,
                trailing: AppStrings.seeAll,
              ),
              16.addVerticalSpace,
              StreamBuilder<QuerySnapshot>(
                stream: sl<FirebaseFirestore>()
                    .collection(FirebaseConstant.additionalExerciseCollection)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final categoryDocs = snapshot.data!.docs;
                  final resultList = homeProvider.filterExerciseByGoal(
                      categoryDocs, homeProvider.goalModel?.id);

                  return HorizontalExerciseList(resultList: resultList);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class AppBarBody extends StatelessWidget {
  const AppBarBody({
    super.key,
    required this.greeting,
  });

  final String greeting;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 22.r,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: "${sl<FirebaseAuth>().currentUser?.photoURL}",
                  placeholder: (context, url) => Image.asset(
                    ImageApp.backgroundImageSecond,
                    fit: BoxFit.cover,
                    height: 44,
                    width: 44,
                  ), // Placeholder widget while loading
                  errorWidget: (context, url, error) => Image.asset(ImageApp
                      .backgroundImageSecond), // Display default image on error
                ),
              ),
              backgroundColor: ColorManager.primary,
            ),
            15.addHorizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello, $greeting ",
                    style: StyleManger.headline4()
                        .copyWith(fontSize: 12.sp, color: ColorManager.white)),
                Text(
                  "${sl<SharedPrefController>().getUserData().name.split(" ")[0]}"
                      .toCapitalized(),
                  style: TextStyle(
                      fontSize: FontSize.s20,
                      fontWeight: FontWeight.w500,
                      color: ColorManager.white),
                ),
              ],
            ),
          ],
        ),
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.white.withOpacity(0.05),
        ),
        CircleAvatar(
          radius: 80,
          backgroundColor: Colors.white.withOpacity(0.05),
        ),
        CircleAvatar(
          radius: 120,
          backgroundColor: Colors.white.withOpacity(0.05),
        ),
      ],
    );
  }
}
