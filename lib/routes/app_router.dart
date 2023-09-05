import 'package:flutter/material.dart';

class AppRouter {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  goToAndRemove({required String screenName, Object? object}) {
    navigatorKey.currentState!
        .pushReplacementNamed(screenName, arguments: object);
  }

  goTo({required String screenName, Object? object}) async{
  return await navigatorKey.currentState!.pushNamed(screenName, arguments: object);
  }

  back([dynamic result]) {
    navigatorKey.currentState!.pop(result);
  }

  mayBack() {
    navigatorKey.currentState!.maybePop();
  }

  removeAllBack({required String screenName}) {
    navigatorKey.currentState!
        .pushNamedAndRemoveUntil(screenName, (Route<dynamic> route) => false);
  }
}
