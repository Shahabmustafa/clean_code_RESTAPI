import 'package:flutter_setup/view.dart';

class LightTheme{
  LightTheme._();

  static ThemeData lightTheme = ThemeData(

    /// text theme
    textTheme: TextTheme(

      /// large text style start 24 to 32
      titleLarge: Constant.fontFamily(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),
      headlineLarge: Constant.fontFamily(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),
      displayLarge: Constant.fontFamily(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),
      bodyLarge: Constant.fontFamily(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),
      labelLarge: Constant.fontFamily(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),

      /// Medium text style start 14 to 22
      titleMedium: Constant.fontFamily(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColor.black,
      ),
      headlineMedium: Constant.fontFamily(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColor.primaryColor,
      ),
      displayMedium: Constant.fontFamily(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColor.primaryColor,
      ),
      bodyMedium: Constant.fontFamily(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColor.primaryColor,
      ),
      labelMedium: Constant.fontFamily(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: AppColor.primaryColor,
      ),

      /// small text style start to 8 to 13
      titleSmall: Constant.fontFamily(
        fontSize: 8,
        fontWeight: FontWeight.w400,
        color: AppColor.black,
      ),
      headlineSmall: Constant.fontFamily(
        fontSize: 9,
        fontWeight: FontWeight.w400,
        color: AppColor.black,
      ),
      displaySmall: Constant.fontFamily(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: AppColor.black,
      ),
      bodySmall: Constant.fontFamily(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: AppColor.black,
      ),
      labelSmall: Constant.fontFamily(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColor.black,
      ),

    ),

    /// appbar theme
    appBarTheme: AppBarTheme(
      titleTextStyle: Constant.fontFamily(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: AppColor.black,
      ),
      backgroundColor: AppColor.white,
    ),

    /// scaffold theme
    scaffoldBackgroundColor: AppColor.white,

    /// listTile theme
    listTileTheme: ListTileThemeData(
      titleTextStyle: Constant.fontFamily(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: AppColor.primaryColor,
      ),
      subtitleTextStyle: Constant.fontFamily(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: AppColor.grey,
      ),
    ),

    /// inputDecoration theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColor.white,
      suffixIconColor: AppColor.primaryColor,
      prefixIconColor: AppColor.primaryColor,
      hintFadeDuration: const Duration(seconds: 1),
      hoverColor: AppColor.primaryColor,
      /// input border
      border: OutlineInputBorder(
        borderRadius: Constant.borderRadius,
        borderSide: const BorderSide(
          color: AppColor.primaryColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: Constant.borderRadius,
        borderSide: const BorderSide(
          color: AppColor.primaryColor,
          width: 2.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: Constant.borderRadius,
        borderSide: const BorderSide(
          color: AppColor.primaryColor,
          width: 1.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: Constant.borderRadius,
        borderSide: const BorderSide(
          color: AppColor.error,
          width: 1.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: Constant.borderRadius,
        borderSide: const BorderSide(
          color: AppColor.error,
          width: 1.0,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: Constant.borderRadius,
        borderSide: const BorderSide(
          color: AppColor.grey,
          width: 2.0,
        ),
      ),
      hintStyle: Constant.fontFamily(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: AppColor.black,
      ),
      labelStyle: Constant.fontFamily(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: AppColor.black,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10.0,
      ),
    ),

    /// icon theme
    iconTheme: const IconThemeData(
      color: AppColor.primaryColor,
    ),

    /// card theme
    cardTheme: CardTheme(
      color: AppColor.white,
      shape: OutlineInputBorder(
        borderRadius: Constant.borderRadius,
      ),
    ),

    /// floating action button theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor,
      foregroundColor: AppColor.white,
    ),

  );

}