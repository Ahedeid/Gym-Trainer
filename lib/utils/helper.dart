import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';

log(message) {
  if (kDebugMode) {
    print('\x1B[32m $message \x1B[0m');
  }
}

class UtilsConfig {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackBarMessage({required String message, required bool status}) {
    return scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              status == true
                  ? Icons.check_circle_outline
                  : Icons.dangerous_outlined,
              color: ColorManager.borderSnackBarFalse,
            ),
            Expanded(
              child: Text(
                message,
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: const TextStyle(
                  fontSize: FontSize.s16,
                  color: ColorManager.primaryTextColor,
                ),
              ),
            ),
          ],
        ),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide(
            color: status
                ? ColorManager.borderSnackBarTrue
                : ColorManager.borderSnackBarFalse,
          ),
        ),
        elevation: 0,
        backgroundColor: status
            ? ColorManager.backGroundSnackBarTrue
            : ColorManager.backGroundSnackBarFalse,
      ),
    );
  }

  static showAlertDialog(BuildContext context, String title) {
    AlertDialog alert = AlertDialog(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      actionsAlignment: MainAxisAlignment.center,
      icon: Align(
        alignment: Alignment.topRight,
        child: InkWell(
          onTap: () {
            sl<AppRouter>().back();
          },
          child: const Icon(
            Icons.close,
            size: 20,
          ),
        ),
      ),
      iconPadding: const EdgeInsets.only(right: 10, top: 10),
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      content: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: ColorManager.primaryTextColor,
          ),
        ),
      ),
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              backgroundColor: ColorManager.whiteText,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: ColorManager.borderColor,
                ),
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            onPressed: () => Navigator.pop(context, false),
            child: const Text(
              'No',
              style: TextStyle(color: ColorManager.primaryTextColor),
            )),
        ElevatedButton(
          onPressed: () {
            sl<AppRouter>().back();
            UtilsConfig.showSnackBarMessage(
                message: 'Bank account has been deleted.', status: true);
            //  bank.removeItem(index);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.whiteText,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: ColorManager.borderColor,
                ),
                borderRadius: BorderRadius.circular(7),
              )),
          child: const Text(
            'Yes',
            style: TextStyle(
              color: ColorManager.primaryTextColor,
            ),
          ),
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void navigateAfterSuccess({required String screenName}) {
    UtilsConfig.showSnackBarMessage(
      message: successAccount.tr(),
      status: true,
    );
    sl<AppRouter>().goToAndRemove(screenName: screenName);
  }

  static void showOnException(FirebaseException exception) {
    final message = exception.message.toString();
    UtilsConfig.showSnackBarMessage(
      message: message,
      status: false,
    );
  }
}
