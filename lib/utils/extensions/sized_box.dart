import 'package:flutter/material.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/service_locator.dart';

extension FlutterSizes on num {
  static final MediaQueryData mediaQueryData =
      MediaQuery.of(sl<AppRouter>().navigatorKey.currentState!.context);
  static final double screenDeviceWidth = mediaQueryData.size.width;
  static final double screenDeviceHeight = mediaQueryData.size.height;
  static const designWidth = 360;
  static const designHeight = 800;

  SizedBox get addHorizontalSpace {
    return SizedBox(
      width: screenDeviceWidth * (toDouble() / designHeight),
    );
  }

  SizedBox get addVerticalSpace {
    return SizedBox(
      height: screenDeviceHeight * (toDouble() / screenDeviceHeight),
    );
  }

  double get dp {
    return toDouble();
  }

  double get width {
    return screenDeviceWidth * (toDouble() / designWidth);
  }

  double get height {
    return screenDeviceHeight * (toDouble() / designHeight);
  }

  double get textSp {
    return screenDeviceWidth * (toDouble() / designWidth);
  }

  double get borderRadius {
    return toDouble();
  }

  EdgeInsets get paddingAll {
    return EdgeInsets.all(toDouble());
  }

  EdgeInsets get paddingHorizontal {
    return EdgeInsets.symmetric(
        horizontal: screenDeviceWidth * (toDouble() / designWidth));
  }

  EdgeInsets get paddingVertical {
    return EdgeInsets.symmetric(
        vertical: screenDeviceHeight * (toDouble() / designHeight));
  }

  EdgeInsets get paddingTop {
    return EdgeInsets.only(
        top: screenDeviceHeight * (toDouble() / designHeight));
  }

  EdgeInsets get paddingBottom {
    return EdgeInsets.only(
        bottom: screenDeviceHeight * (toDouble() / designHeight));
  }

  EdgeInsets get paddingLeft {
    return EdgeInsets.only(
        left: screenDeviceWidth * (toDouble() / designWidth));
  }

  EdgeInsets get paddingRight {
    return EdgeInsets.only(
        right: screenDeviceWidth * (toDouble() / designWidth));
  }

  EdgeInsets get paddingFromLTRB {
    final value = toDouble();
    return EdgeInsets.fromLTRB(
      screenDeviceWidth * (value / designWidth),
      screenDeviceHeight * (value / designHeight),
      screenDeviceWidth * (value / designWidth),
      screenDeviceHeight * (value / designHeight),
    );
  }

  EdgeInsets get marginAll {
    return EdgeInsets.all(toDouble());
  }

  EdgeInsets get marginHorizontal {
    return EdgeInsets.symmetric(
        horizontal: screenDeviceWidth * (toDouble() / designWidth));
  }

  EdgeInsets get marginVertical {
    return EdgeInsets.symmetric(
        vertical: screenDeviceHeight * (toDouble() / designHeight));
  }

  EdgeInsets get marginTop {
    return EdgeInsets.only(
        top: screenDeviceHeight * (toDouble() / designHeight));
  }

  EdgeInsets get marginBottom {
    return EdgeInsets.only(
        bottom: screenDeviceHeight * (toDouble() / designHeight));
  }

  EdgeInsets get marginLeft {
    return EdgeInsets.only(
        left: screenDeviceWidth * (toDouble() / designWidth));
  }

  EdgeInsets get marginRight {
    return EdgeInsets.only(
        right: screenDeviceWidth * (toDouble() / designWidth));
  }

  EdgeInsets get marginFromLTRB {
    final value = toDouble();
    return EdgeInsets.fromLTRB(
      screenDeviceWidth * (value / designWidth),
      screenDeviceHeight * (value / designHeight),
      screenDeviceWidth * (value / designWidth),
      screenDeviceHeight * (value / designHeight),
    );
  }

  BorderRadius get circularRadius {
    return BorderRadius.circular(toDouble());
  }
}
