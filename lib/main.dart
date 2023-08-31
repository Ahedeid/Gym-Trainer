import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/feature/home_screen/providers/home_provider.dart';
import 'package:gym_app/firebase_options.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/routes/router_generator.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/utils/helper.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/theamManeager.dart';
import 'package:provider/provider.dart';

// pr
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ScreenUtil.ensureScreenSize();

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
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(
              value: sl<HomeProvider>(),
            )
          ],
          child: MaterialApp(
            theme: ThemeManager.lightTheme,
            themeMode: _themeManagerT.themeMode,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.onGenerateRoute,
            initialRoute: ScreenName.splashScreen,
            navigatorKey: sl<AppRouter>().navigatorKey,
            scaffoldMessengerKey: UtilsConfig.scaffoldKey,
          ),
        );
      },
    );
  }
}
//PR
/*


------------------------
  test@test.com
  123456@Test



test@gmail.com1
mmMM112233$

----------------------
*/
