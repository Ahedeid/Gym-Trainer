import 'package:flutter/material.dart';
import 'package:gym_app/feature/home_screen/models/exercise_model.dart';
import 'package:gym_app/feature/home_screen/providers/home_provider.dart';
import 'package:gym_app/feature/home_screen/ui/widgets/horizontal_exercise_widget.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/sheared/widget/bottomSheetDedailsWidget.dart';
import 'package:gym_app/utils/extensions/sized_box.dart';

class HorizontalExerciseList extends StatelessWidget {
  const HorizontalExerciseList({
    super.key,
    required this.resultList,
  });

  final List<ExerciseModel> resultList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: resultList.length,
      separatorBuilder: (context, index) => Column(
        children: [
          10.addVerticalSpace,
          Divider(),
          10.addVerticalSpace,
        ],
      ),
      itemBuilder: (context, index) {
        bool? isLock = resultList[index].isLocked;
        return GestureDetector(
          onTap: (){
            if (isLock == true) {
              showModalBottomSheet(
                  useSafeArea: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  context: context,
                  builder: (context) => BottomSheetDetailsWidget());
            } else {
              sl<HomeProvider>()
                  .getCategoryName(resultList[index].categoryId);
              sl<AppRouter>().goTo(
                  screenName: ScreenName.exercisesDetailsScreen,
                  object: resultList[index]);
            }
          },
          child: HorizontalExerciseWidget(
            exerciseModel: resultList[index],
          ),
        );
      },
    );
  }
}
