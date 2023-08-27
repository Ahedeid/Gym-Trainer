import 'package:gym_app/utils/resources/images_constant.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';

class PageViewModel {
  final String? imagePath;

  final String title;

  final String bodyText;

  PageViewModel({required this.imagePath, required this.title, required this.bodyText});

  static List<PageViewModel> data = [
    PageViewModel(
      imagePath: ImageApp.backgroundImageFirst,
      title: AppStrings.headerToOnBoarding[0],
      bodyText: AppStrings.bodyToOnBoarding[0],
    ),
    PageViewModel(
      imagePath: ImageApp.backgroundImageSecond,
      title: AppStrings.headerToOnBoarding[1],
      bodyText: AppStrings.bodyToOnBoarding[1],
    ),
    PageViewModel(
      imagePath: ImageApp.backgroundImageThird,
      title: AppStrings.headerToOnBoarding[2],
      bodyText: AppStrings.bodyToOnBoarding[2],
    )
  ];
}
