import 'package:flutter/material.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';

class CustomButtonOnBoarding extends StatelessWidget {
  const CustomButtonOnBoarding({
    Key? key,
    required int index,
    required PageController controller,
    required this.color,
  })  : _index = index,
        _controller = controller,
        super(key: key);

  final int _index;
  final PageController _controller;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _index == 2
            ? sl<AppRouter>().goToAndRemove(screenName: ScreenName.signUpScreen)
            : _controller.nextPage(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.decelerate);
      },
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
            backgroundColor: MaterialStatePropertyAll(color),
          ),
      child: _index == 2
          ? const Text(
              'Login',
              style: TextStyle(fontSize: 18,color: ColorManager.white),
            )
          : const Text(
              'Next',
              style: TextStyle(
                fontSize: FontSize.s16,
                  color: ColorManager.white
              ),
            ),
    );
  }
}
