import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_app/firebase_options.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/routes/router_generator.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/utils/helper.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/theamManeager.dart';

// pr
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: ColorManager.scaffoldColor,
    statusBarColor: ColorManager.scaffoldColor,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const GymApp());
}

ThemeManagerT _themeManagerT = ThemeManagerT();

class GymApp extends StatelessWidget {
  const GymApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeManager.lightTheme,
      themeMode: _themeManagerT.themeMode,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      initialRoute: ScreenName.splashScreen,
      navigatorKey: sl<AppRouter>().navigatorKey,
      scaffoldMessengerKey: UtilsConfig.scaffoldKey,
    );
  }
}

/*
------------------------
  test@test.com
  123456@Test
  ----------------------
*/
