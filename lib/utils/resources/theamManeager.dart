import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/utils/resources/font_size.dart';
import 'package:gym_app/utils/resources/sizes_in_app.dart';

import 'colors_manger.dart';

class ThemeManager {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: false,
      brightness: Brightness.light,
      primaryColor: ColorManager.primary,
      scaffoldBackgroundColor: ColorManager.scaffoldColor,
      fontFamily: GoogleFonts.poppins().fontFamily,
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        buttonColor: ColorManager.primary,
      ),
//-------------------------------AppBarTheme------------------------------------

      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          toolbarHeight: AppSize.s100,
          elevation: 0,
          iconTheme: IconThemeData(
            size: FontSize.s26,
            color: ColorManager.primaryTextColor,
          ),
          centerTitle: false,
          // titleSpacing: 30,
          actionsIconTheme: IconThemeData(
            size: AppSize.s25,
            color: Color(0xFF000000),
          ),
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
            fontSize: 22.0,
            fontFamily: 'Avenir Arabic',
            fontWeight: FontWeight.w600,
            color: ColorManager.primaryTextColor,
          )),

//--------------------------------textTheme-------------------------------------
//         textTheme: TextTheme(
//             displayLarge: TextStyle(
//                 fontSize: 40,
//                 fontFamily: 'Raleway',
//                 fontWeight: FontWeight.w600,
//                 color: ColorManager.primaryTextColor),
//             displayMedium: TextStyle(
//                 fontSize: 22.0,
//                 fontFamily: 'Raleway',
//                 fontWeight: FontWeight.bold,
//                 color: ColorManager.primaryTextColor),
//             displaySmall: TextStyle(
//                 fontSize: 17.0,
//                 fontFamily: 'Raleway',
//                 fontWeight: FontWeight.w600,
//                 color: ColorManager.primaryTextColor),
//             headlineLarge: TextStyle(
//                 fontSize: 26.0,
//                 fontFamily: 'Raleway',
//                 fontWeight: FontWeight.w700,
//                 color: ColorManager.primaryTextColor),
//             headlineMedium: TextStyle(
//                 fontSize: 14.0,
//                 fontFamily: 'Raleway',
//                 fontWeight: FontWeight.normal,
//                 color: ColorManager.primaryTextColor),
//             headlineSmall: TextStyle(
//                 fontSize: 13.0,
//                 fontFamily: 'Raleway',
//                 fontWeight: FontWeight.normal,
//                 color: ColorManager.primaryTextColor),
//             titleLarge: TextStyle(
//                 fontSize: 26.0,
//                 fontFamily: 'Raleway',
//                 fontWeight: FontWeight.w700,
//                 color: ColorManager.primaryTextColor),
//             titleSmall: TextStyle(
//                 fontSize: 24,
//                 fontFamily: 'Raleway',
//                 fontWeight: FontWeight.normal,
//                 color: ColorManager.secondaryTextColor),
//             bodyLarge: TextStyle(
//                 fontSize: 11.0,
//                 fontFamily: 'Raleway',
//                 fontWeight: FontWeight.normal,
//                 color: ColorManager.primaryTextColor),
//             bodyMedium: TextStyle(
//                 fontSize: 12.0,
//                 fontFamily: 'Raleway',
//                 fontWeight: FontWeight.normal,
//                 color: ColorManager.primaryTextColor),
//             titleMedium: TextStyle(
//                 fontSize: 13,
//                 fontFamily: 'Raleway',
//                 fontWeight: FontWeight.normal,
//                 color: ColorManager.primaryTextColor),
//             labelMedium: TextStyle(
//                 fontSize: 14.0,
//                 fontFamily: 'Raleway',
//                 fontWeight: FontWeight.normal,
//                 color: ColorManager.primaryTextColor)),

//-------------------------------ElevatedButtonTheme----------------------------
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 5),
          backgroundColor: ColorManager.primary,
          foregroundColor: Colors.blueAccent,
          disabledBackgroundColor: ColorManager.gray.withOpacity(0.4),
          disabledForegroundColor: ColorManager.white,
          elevation: 0,
          textStyle: const TextStyle(
              fontSize: FontSize.s16,
              fontFamily: 'Avenir Arabic',
              fontWeight: FontWeight.w600,
              color: ColorManager.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
          minimumSize: const Size(double.infinity, 50),
          maximumSize: const Size(double.infinity, 50),
        ),
      ),

//------------------------------InputDecorationTheme----------------------------
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(
          color: ColorManager.secondaryTextColor,
          fontSize: FontSize.s14,
        ),
        filled: true,
        fillColor: ColorManager.backgroundInputFiled,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: ColorManager.borderColor,
            )),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: ColorManager.borderColor,
            width: 1,
          ),
        ),
      ),

//------------------------------------------------------------------------------
    );
  }
}

class ThemeManagerT with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  get themeMode => _themeMode;

  toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

// TextTheme _textTheme = Theme.of(context).textTheme;
