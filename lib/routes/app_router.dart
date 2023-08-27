import 'package:flutter/material.dart';

class AppRouter {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  goToAndRemove({required String screenName, Object? object}) {
    navigatorKey.currentState!
        .pushReplacementNamed(screenName, arguments: object);
  }

  goTo({required String screenName, Object? object}) {
    navigatorKey.currentState!.pushNamed(screenName, arguments: object);
  }

  back() {
    navigatorKey.currentState!.pop();
  }

  mayBack() {
    navigatorKey.currentState!.maybePop();
  }

  removeAllBack({required String screenName}) {
    navigatorKey.currentState!
        .pushNamedAndRemoveUntil(screenName, (Route<dynamic> route) => false);
  }
}
