import 'package:flutter/material.dart';
import 'package:gym_app/feature/BNBUser.dart';
import 'package:gym_app/feature/articles/models/articles_model.dart';
import 'package:gym_app/feature/articles/ui/articles_details_screen.dart';
import 'package:gym_app/feature/home_screen/models/categorie_model.dart';
import 'package:gym_app/feature/home_screen/models/exercise_model.dart';
import 'package:gym_app/feature/home_screen/providers/home_provider.dart';
import 'package:gym_app/feature/home_screen/ui/categorys_screen.dart';
import 'package:gym_app/feature/home_screen/ui/exercise_details.dart';
import 'package:gym_app/feature/home_screen/ui/full_exercises_screen.dart';
import 'package:gym_app/feature/home_screen/ui/home_screen.dart';
import 'package:gym_app/feature/home_screen/ui/see_all_screen.dart';
import 'package:gym_app/feature/home_screen/ui/start_training.dart';
import 'package:gym_app/feature/meals_plan/models/meal_plan_model.dart';
import 'package:gym_app/feature/meals_plan/ui/plan_details.dart';
import 'package:gym_app/feature/notification/ui/notification_screen.dart';
import 'package:gym_app/feature/onBoardingScreens/page_view.dart';
import 'package:gym_app/feature/profile/provider/profile_provider.dart';
import 'package:gym_app/feature/profile/ui/coming_soon_screen.dart';
import 'package:gym_app/feature/profile/ui/faq_screen.dart';
import 'package:gym_app/feature/profile/ui/language_screen.dart';
import 'package:gym_app/feature/profile/ui/notification_setting_screen.dart';
import 'package:gym_app/feature/profile/ui/terms_conditions_screen.dart';
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
import 'package:gym_app/feature/Training/providers/training_provider.dart';
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
      // case ScreenName.qrScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const ScannerScreen(),
      //   );
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
      // case ScreenName.classScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const ClassScreen(),
      //   );
      // ----------------------- ClassDetailsScreen ----------------------------
      // case ScreenName.classDetailsScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const ClassDetailsScreen(),
      //   );

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

      // ----------------------- exercisesDetailsScreen ------------------------
      case ScreenName.exercisesDetailsScreen:
        var exerciseModel = settings.arguments as ExerciseModel;
        return MaterialPageRoute(
          builder: (_) => ExerciseDetails(
            exerciseModel: exerciseModel,
          ),
        );

      // --------------------------- startTraining -----------------------------
      case ScreenName.startTraining:
        var exerciseModel = settings.arguments as ExerciseModel;
        return MaterialPageRoute(
          builder: (_) => StartTraining(
            exerciseModel: exerciseModel,
          ),
        );
      // --------------------- TermsAndConditionsScreen ------------------------
      case ScreenName.termsAndConditionsScreen:
        return MaterialPageRoute(
          builder: (_) => TermsAndConditionsScreen(),
        );
      // ------------------------- FAQScreen -----------------------------------
      case ScreenName.fAQScreen:
        return MaterialPageRoute(
          builder: (_) => FAQScreen(),
        );
      // ------------------------- NotificationSettingScreen --------------------
      case ScreenName.notificationSettingScreen:
        return MaterialPageRoute(
          builder: (_) => NotificationSettingScreen(),
        );
      // ------------------------- LanguageScreen ------------------------------
      case ScreenName.languageScreen:
        return MaterialPageRoute(
          builder: (_) => LanguageScreen(),
        );
      // ------------------------- ComingSoonScreen ----------------------------
      case ScreenName.comingSoonScreen:
        var title = settings.arguments as bool;
        return MaterialPageRoute(
          builder: (_) => ComingSoonScreen(
            isMemberShipScreen: title,
          ),
        );
      // ------------------------- NotificationScreen ---------------------------
      case ScreenName.notificationScreen:
        return MaterialPageRoute(
          builder: (_) => NotificationScreen(),
        );
      // ---------------------------- See All  ---------------------------------
      case ScreenName.seeAllScreen:
        var id = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => SeeAllExercisesScreen(goalId: id),
        );
      // ------------------------- MealPlanDetails -----------------------------
      case ScreenName.mealPlanDetails:
        var mealPlan = settings.arguments as MealPlan;
        return MaterialPageRoute(
          builder: (_) => MealPlanDetails(mealPlan: mealPlan),
        );
        // ------------------------- ArticlesDetailsScreen -----------------------------
      case ScreenName.articlesDetailsScreen:
        var articlesObject = settings.arguments as ArticlesModel;
        return MaterialPageRoute(
          builder: (_) => ArticlesDetailsScreen(articles: articlesObject,),
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
