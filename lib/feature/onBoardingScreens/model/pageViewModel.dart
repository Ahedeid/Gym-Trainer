import 'package:gym_app/utils/resources/images_constant.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';

class PageViewModel {
  final String? imagePath;

  final String title;

  final String bodyText;

  PageViewModel(
      {required this.imagePath, required this.title, required this.bodyText});

  static List<PageViewModel> data = [
    PageViewModel(
      imagePath: ImageApp.backgroundImageFirst,
      title: headerToOnBoarding[0].tr(),
      bodyText: bodyToOnBoarding[0].tr(),
    ),
    PageViewModel(
      imagePath: ImageApp.backgroundImageSecond,
      title: headerToOnBoarding[1].tr(),
      bodyText: bodyToOnBoarding[1].tr(),
    ),
    PageViewModel(
      imagePath: ImageApp.backgroundImageThird,
      title: headerToOnBoarding[2].tr(),
      bodyText: bodyToOnBoarding[2].tr(),
    )
  ];
}
