import 'dart:async';

import 'package:gym_app/logic/localData/shared_pref.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/service_locator.dart';

class AppConfig {
  var pef = sl<SharedPrefController>();
  var nav = sl<AppRouter>();

  void onBoardingStatue() {
    Timer(const Duration(seconds: 5), () {
      checkFirstSeen();
    });
  }

  Future<void> checkFirstSeen() async {
    bool seen = await pef.getShowOnce();
    bool isAuthenticated = sl<SharedPrefController>().getUserData().uid != "";
    print("is Auth ? $isAuthenticated");
    if (seen) {
      if (isAuthenticated) {
        nav.goToAndRemove(screenName: ScreenName.BNBUser);
      } else {
        nav.goToAndRemove(screenName: ScreenName.loginScreen);
      }
    } else {
      sl<SharedPrefController>().setShowOnce(true);
      nav.goToAndRemove(screenName: ScreenName.pageViewScreens);
    }
  }
}
