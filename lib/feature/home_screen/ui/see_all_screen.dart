import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/feature/home_screen/models/exercise_model.dart';
import 'package:gym_app/feature/home_screen/providers/home_provider.dart';
import 'package:gym_app/feature/home_screen/ui/widgets/horizontal_exercise_list.dart';
import 'package:gym_app/logic/firebase_constant.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/sheared/screens/EmptyDataScreen.dart';
import 'package:gym_app/sheared/widget/customAppBar.dart';
import 'package:gym_app/utils/resources/sizes_in_app.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';
import 'package:provider/provider.dart';

class SeeAllExercisesScreen extends StatefulWidget {
  SeeAllExercisesScreen({required this.goalId, super.key});

  final String goalId;

  @override
  State<SeeAllExercisesScreen> createState() => _SeeAllExercisesScreenState();
}

class _SeeAllExercisesScreenState extends State<SeeAllExercisesScreen> {
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
                .collection(homeProvider.isAdditional == false
                    ? FirebaseConstant.exercisesCollection
                    : FirebaseConstant.additionalExerciseCollection)
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
                categoryDocs,
                widget.goalId,
              );
              // ToDo Add loading state here
              return resultList.isEmpty
                  ? ToEmptyDataWidget(
                      title: 'Exercises is Empty '.tr(),
                      subTitle: 'Add Exercises Please'.tr(),
                    )
                  : HorizontalExerciseList(
                      resultList: homeProvider.isAdditional == false
                          ? resultList
                          : categoryDocs
                              .map((e) => ExerciseModel.fromDocumentSnapshot(e))
                              .toList());
            },
          ),
        ),
      ),
    );
  }
}
