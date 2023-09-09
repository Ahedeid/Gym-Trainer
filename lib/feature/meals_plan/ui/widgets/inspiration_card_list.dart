import 'package:flutter/material.dart';
import 'package:gym_app/feature/meals_plan/models/meal_plan_model.dart';
import 'package:gym_app/feature/meals_plan/ui/widgets/inspiration_card_widget.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/utils/extensions/sized_box.dart';

class InspirationCardList extends StatelessWidget {
  const InspirationCardList({
    super.key,
    required this.planList,
  });

  final List<MealPlan> planList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(bottom: 32),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: planList.length,
      separatorBuilder: (context, index) => Column(
        children: [
          10.addVerticalSpace,
          Divider(),
          10.addVerticalSpace,
        ],
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            sl<AppRouter>().goTo(
                screenName: ScreenName.mealPlanDetails,
                object: planList[index]);
          },
          child: InspirationCardWidget(
            mealPlan: planList[index],
          ),
        );
      },
    );
  }
}
