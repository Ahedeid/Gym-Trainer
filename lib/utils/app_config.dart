import 'package:gym_app/logic/localData/shared_pref.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/service_locator.dart';

class AppConfig {
  var pef = sl<SharedPrefController>();
  var nav = sl<AppRouter>();

  void onDone() {
    bool onBoardingShows = pef.getShowOnce();
    bool isLogIn = pef.getLogedin();
    Future.delayed(
      const Duration(seconds: 3),
      () => nav.goToAndRemove(
        screenName:
            // ScreenName.BNBUser
            isLogIn
                ? ScreenName.BNBUser
                : onBoardingShows
                    ? ScreenName.loginScreen
                    : ScreenName.pageViewScreens,
      ),
    );
  }
}
