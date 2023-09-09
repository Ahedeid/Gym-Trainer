import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/feature/home_screen/providers/home_provider.dart';
import 'package:gym_app/feature/home_screen/ui/widgets/horizontal_exercise_list.dart';
import 'package:gym_app/logic/firebase_constant.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/sheared/screens/EmptyDataScreen.dart';
import 'package:gym_app/sheared/widget/customAppBar.dart';
import 'package:gym_app/utils/resources/sizes_in_app.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';
import 'package:provider/provider.dart';

class FullExercisesScreen extends StatefulWidget {
  FullExercisesScreen({required this.categoryId, super.key});

  final String categoryId;

  @override
  State<FullExercisesScreen> createState() => _FullExercisesScreenState();
}

class _FullExercisesScreenState extends State<FullExercisesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.fullExercise,
        visible: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingHorizontal,
          vertical: AppSizes.paddingVertical,
        ),
        child: Consumer<HomeProvider>(
          builder: (context, homeProvider, child) =>
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
              final resultList = homeProvider.filterExerciseByGoalAndCategory(
                exerciseDocs: categoryDocs,
                goalId: homeProvider.goalModel!.id,
                categoryId: widget.categoryId,
              );
              // ToDo Add loading state here
              return resultList.isEmpty
                  ? ToEmptyDataWidget(
                      title: 'Exercises is Empty '.tr(),
                      subTitle: 'Add Exercises Please'.tr(),
                    )
                  : HorizontalExerciseList(resultList: resultList);
            },
          ),
        ),
      ),
    );
  }
}
