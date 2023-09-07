import 'package:flutter/material.dart';
import 'package:gym_app/feature/notification/notification_setup/local_notification_service.dart';
import 'package:gym_app/logic/localData/shared_pref.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/service_locator.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalService {
  static OneSignal? _instance;
  final _sharedPref = sl<SharedPrefController>;

  oneSignalSService() {
    final String? userId = _sharedPref().getUserData().uid;
    getInstance();
    _instance!.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    _instance!.setAppId("f991108f-b663-444a-b789-2060ad99f6b6");
    _instance!.setExternalUserId(userId ?? " ");
    debugPrint("This is userId ======>>>>>> $userId \n \n \n \n");

// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    _instance!.promptUserForPushNotificationPermission().then((accepted) {
      debugPrint("Accepted permission: $accepted");
    });

    _instance!.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      debugPrint("This is in Notification Foreground  =====>>>>>>>>> \n");
      createLocalNotification(
          title: event.notification.title!, body: event.notification.body!);
// Will be called whenever a notification is received in foreground
// Display Notification, pass null param for not displaying the notification
      event.complete(event.notification);
    });

    _instance!
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      // createLocalNotification(title: result.notification.title!,body: result.notification.body!);
      debugPrint(
          "This is data notification =====>>>>> \n${result.notification.additionalData}");
      sl<AppRouter>().goTo(screenName: ScreenName.notificationScreen);
      // ServiceNavigation.serviceNavi.pushNamedWidget(RouteGenerator.notificationDetailsPage);

      // Navigator.push(
      //     Helpers.scaffoldKey.currentState!.context,
      //     MaterialPageRoute(
      //         builder: (context) => NotificationDetailsPage(
      //             data: result.notification.additionalData)));

// Will be called whenever a notification is opened/button pressed.
    });

//     _instance!.setPermissionObserver((OSPermissionStateChanges changes) {
// // Will be called whenever the permission changes
// // (ie. user taps Allow on the permission prompt in iOS)
//     });
  }

  disposeOnesignal() {
    getInstance();
    _instance!.removeExternalUserId();
  }

  static OneSignal? getInstance() {
    _instance ??= OneSignal.shared;
    return _instance;
  }

  Future<void> getUserTokenId() async {
    var deviceState = await _instance!.getDeviceState();
    if (deviceState != null || deviceState?.userId != null) {
      String tokenId = deviceState!.userId!;
      debugPrint("TOKEN ID: $tokenId");
    }
  }

  void handleSendNotification(
      {required String tokenId,
      required String title,
      required String desc}) async {
    var notification = OSCreateNotification(
        playerIds: [tokenId], content: desc, heading: title);
    await _instance!.postNotification(notification);
  }
}
