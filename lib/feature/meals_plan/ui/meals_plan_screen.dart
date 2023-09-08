import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/feature/home_screen/ui/widgets/header_section_widget.dart';
import 'package:gym_app/feature/meals_plan/models/meal_plan_model.dart';
import 'package:gym_app/feature/meals_plan/ui/widgets/inspiration_card_list.dart';
import 'package:gym_app/logic/firebase_constant.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/sheared/widget/customAppBar.dart';
import 'package:gym_app/utils/extensions/sized_box.dart';
import 'package:gym_app/utils/resources/images_constant.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';

class MealsPlan extends StatelessWidget {
  const MealsPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.mealsPlan.tr(),
        onTap: () {},
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  child: Image.asset(ImageApp.cover)),
              20.addVerticalSpace,
              HeaderSectionWidget(
                title: AppStrings.dailyInspiration.tr(),
                trailing: AppStrings.seeAll.tr(),
              ),
              10.addVerticalSpace,
              StreamBuilder<QuerySnapshot>(
                stream: sl<FirebaseFirestore>()
                    .collection(FirebaseConstant.plans)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final List plans = snapshot.data!.docs;

                  return InspirationCardList(
                      planList: plans
                          .map((e) => MealPlan.fromDocumentSnapshot(e))
                          .toList());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
