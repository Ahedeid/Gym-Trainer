import 'package:gym_app/utils/resources/images_constant.dart';

class PageViewModel {
  final String? imagePath;

  final String title;

  final String bodyText;

  PageViewModel(
      {required this.imagePath, required this.title, required this.bodyText});

  static List<PageViewModel> data = [
    PageViewModel(
      imagePath: ImageApp.backgroundImageFirst,
      title: "headerToOnBoarding[0]",
      bodyText: "bodyToOnBoarding[0]",
    ),
    PageViewModel(
      imagePath: ImageApp.backgroundImageSecond,
      title: "headerToOnBoarding[1]",
      bodyText: "bodyToOnBoarding[1]",
    ),
    PageViewModel(
      imagePath: ImageApp.backgroundImageThird,
      title: "headerToOnBoarding[2]",
      bodyText: "bodyToOnBoarding[2]",
    )
  ];
}
