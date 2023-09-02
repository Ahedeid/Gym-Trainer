import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/feature/BNBUser.dart';
import 'package:gym_app/feature/home_screen/models/categorie_model.dart';
import 'package:gym_app/feature/home_screen/models/exercise_model.dart';
import 'package:gym_app/feature/home_screen/providers/home_provider.dart';
import 'package:gym_app/feature/home_screen/ui/categorys_screen.dart';
import 'package:gym_app/feature/home_screen/ui/class_screen.dart';
import 'package:gym_app/feature/home_screen/ui/details_screen.dart';
import 'package:gym_app/feature/home_screen/ui/exercise_details.dart';
import 'package:gym_app/feature/home_screen/ui/full_exercises_screen.dart';
import 'package:gym_app/feature/home_screen/ui/home_screen.dart';
import 'package:gym_app/feature/home_screen/ui/qr_screen.dart';
import 'package:gym_app/feature/home_screen/ui/start_training.dart';
import 'package:gym_app/feature/onBoardingScreens/page_view.dart';
import 'package:gym_app/feature/profile/provider/profile_provider.dart';
import 'package:gym_app/feature/profile/terms_conditions_screen.dart';
import 'package:gym_app/feature/profile/ui/update_profile_screen.dart';
import 'package:gym_app/feature/registrations/model/user_model.dart';
import 'package:gym_app/feature/registrations/provider/loginProvider.dart';
import 'package:gym_app/feature/registrations/provider/signUpProvider.dart';
import 'package:gym_app/feature/registrations/ui/checkEmailScreen.dart';
import 'package:gym_app/feature/registrations/ui/createNewPassword.dart';
import 'package:gym_app/feature/registrations/ui/loginScreen.dart';
import 'package:gym_app/feature/registrations/ui/reSetPassword.dart';
import 'package:gym_app/feature/registrations/ui/signUpScreen.dart';
import 'package:gym_app/feature/splash_screen.dart';
import 'package:gym_app/feature/workOut/providers/training_provider.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/service_locator.dart';
import 'package:provider/provider.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget result;
    switch (settings.name) {
      // --------------------------- splashScreen ------------------------------
      case ScreenName.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      // --------------------------- PageViewScreens ---------------------------
      case ScreenName.pageViewScreens:
        return MaterialPageRoute(
          builder: (_) => const PageViewScreens(),
        );
      // --------------------------- SignUpScreen ------------------------------
      case ScreenName.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => SignUpProvider(),
              ),
              ChangeNotifierProvider(
                create: (context) => LoginProvider(),
              ),
            ],
            child: const SignUpScreen(),
          ),
        );
      // --------------------------- LoginScreen -------------------------------
      case ScreenName.loginScreen:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => LoginProvider(),
            child: const LoginScreen(),
          ),
        );
      // --------------------------- HomeScreen --------------------------------
      case ScreenName.homeScreen:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider.value(
            value: sl<HomeProvider>(),
            child: HomeScreen(),
          ),
        );
      // --------------------------- ReSetPasswordScreen -----------------------
      case ScreenName.reSetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
              create: (context) => LoginProvider(),
              child: ReSetPasswordScreen()),
        );
      // --------------------------- CheckEmailScreen --------------------------
      case ScreenName.checkEmailScreen:
        return MaterialPageRoute(
          builder: (_) => const CheckEmailScreen(),
        );
      // --------------------------- CreateNewPassword -------------------------
      case ScreenName.createNewPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => CreateNewPasswordScreen(),
        );
      // ------------------------------ BNBUser --------------------------------
      case ScreenName.BNBUser:
        return MaterialPageRoute(
          builder: (_) => MultiProvider(
            providers: [
              ChangeNotifierProvider.value(value: sl<TrainingProvider>()),
              ChangeNotifierProvider.value(value: sl<ProfileProvider>())
            ],
            child: const BNBUser(),
          ),
        );
      // ------------------------------ QrScreen -------------------------------
      case ScreenName.qrScreen:
        return MaterialPageRoute(
          builder: (_) => const ScannerScreen(),
        );
      // --------------------------- UpdateProfileScreen ------------------------
      case ScreenName.updateProfileScreen:
        var userData = settings.arguments as UserModel;
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
              create: (context) => ProfileProvider(),
              child: UpdateProfileScreen(
                userData: userData,
              )),
        );
      // --------------------------- ClassScreen -------------------------------
      case ScreenName.classScreen:
        return MaterialPageRoute(
          builder: (_) => const ClassScreen(),
        );
      // ----------------------- ClassDetailsScreen ----------------------------
      case ScreenName.classDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => const ClassDetailsScreen(),
        );

      // ---------------------- AllCategoryScreen ------------------------------
      case ScreenName.allCategoryScreen:
        var categoryList = settings.arguments as List<CategoryModel>;
        return MaterialPageRoute(
          builder: (_) => CategoryScreen(
            categoryList: categoryList,
          ),
        );
      // -------------------------- FullExercisesScreen ------------------------
      case ScreenName.fullExercisesScreen:
        var categoryList = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => FullExercisesScreen(
            categoryId: categoryList,
          ),
        );

      // ------------------------------ exercisesDetailsScreen -------------------------------
      case ScreenName.exercisesDetailsScreen:
        var exerciseModel = settings.arguments as ExerciseModel;
        return MaterialPageRoute(
          builder: (_) => ExerciseDetails(
            exerciseModel: exerciseModel,
          ),
        );

      // ------------------------------ startTraining -------------------------------
      case ScreenName.startTraining:
        var exerciseModel = settings.arguments as ExerciseModel;
        return MaterialPageRoute(
          builder: (_) => StartTraining(
            exerciseModel: exerciseModel,
          ),
        );
      // --------------------- TermsAndConditionsScreen ----------------------
      case ScreenName.termsAndConditionsScreen:
        return MaterialPageRoute(
          builder: (_) => TermsAndConditionsScreen(),
        );

      default:
        result = const Scaffold(
          body: Center(
            child: Text(
              'Wrong path',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          ),
        );
    }
    return MaterialPageRoute(builder: (context) => result);
  }
}

class ScreenArguments {
  final String title;
  final int id;

  ScreenArguments({required this.title, required this.id});
}
