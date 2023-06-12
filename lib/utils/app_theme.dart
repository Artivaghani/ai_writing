import 'config_packages.dart';

class AppTheme {
  static final light = ThemeData.light().copyWith(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.secondaryColor,
      iconTheme: const IconThemeData(color: AppColors.primaryColor),
      cardColor: AppColors.secondaryColor,
      hintColor: AppColors.terneryColor,
      dividerColor: AppColors.deviderColor,
      textTheme: TextTheme(
          headlineLarge: getTextStyle(AppColors.primaryColor, FontDimen.dimen22,
              fontWeight: FontWeight.w600),
          headlineMedium: getTextStyle(
              AppColors.primaryColor, FontDimen.dimen16,
              fontWeight: FontWeight.w600),
          headlineSmall: getTextStyle(AppColors.primaryColor, FontDimen.dimen14,
              fontWeight: FontWeight.w600),
          bodyLarge: getTextStyle(AppColors.greyColor, FontDimen.dimen16,
              fontWeight: FontWeight.w500),
          bodyMedium: getTextStyle(AppColors.greyColor, FontDimen.dimen14,
              fontWeight: FontWeight.w500),
          bodySmall: getTextStyle(AppColors.greyColor, FontDimen.dimen12,
              fontWeight: FontWeight.w500),
          labelLarge: getTextStyle(AppColors.primaryColor, FontDimen.dimen18,
              fontWeight: FontWeight.w600),
          labelMedium: getTextStyle(AppColors.primaryColor, FontDimen.dimen16, fontWeight: FontWeight.w500),
          labelSmall: getTextStyle(AppColors.primaryColor, FontDimen.dimen14, fontWeight: FontWeight.w500),
          titleLarge: getTextStyle(AppColors.secondaryColor, FontDimen.dimen18, fontWeight: FontWeight.w500),
          titleMedium: getTextStyle(AppColors.secondaryColor, FontDimen.dimen16, fontWeight: FontWeight.w500),
          titleSmall: getTextStyle(AppColors.secondaryColor, FontDimen.dimen14, fontWeight: FontWeight.w500)));

  static final dark = ThemeData.dark().copyWith(
      primaryColor: AppColors.secondaryColor,
      scaffoldBackgroundColor: AppColors.primaryColor,
      iconTheme: const IconThemeData(color: AppColors.secondaryColor),
      cardColor: AppColors.cardColor,
      hintColor: AppColors.deviderColor,
      dividerColor: AppColors.deviderColor,
      textTheme: TextTheme(
          headlineLarge: getTextStyle(AppColors.secondaryColor, FontDimen.dimen22,
              fontWeight: FontWeight.w600),
          headlineMedium: getTextStyle(
              AppColors.secondaryColor, FontDimen.dimen16,
              fontWeight: FontWeight.w600),
          headlineSmall: getTextStyle(AppColors.secondaryColor, FontDimen.dimen14,
              fontWeight: FontWeight.w600),
          bodyLarge: getTextStyle(AppColors.deviderColor, FontDimen.dimen16,
              fontWeight: FontWeight.w500),
          bodyMedium: getTextStyle(AppColors.deviderColor, FontDimen.dimen14,
              fontWeight: FontWeight.w500),
          bodySmall: getTextStyle(AppColors.deviderColor, FontDimen.dimen12,
              fontWeight: FontWeight.w500),
          labelLarge: getTextStyle(AppColors.secondaryColor, FontDimen.dimen18,
              fontWeight: FontWeight.w700),
          labelMedium: getTextStyle(AppColors.secondaryColor, FontDimen.dimen16, fontWeight: FontWeight.w500),
          labelSmall: getTextStyle(AppColors.secondaryColor, FontDimen.dimen14, fontWeight: FontWeight.w500),
          titleLarge: getTextStyle(AppColors.primaryColor, FontDimen.dimen18, fontWeight: FontWeight.w500),
          titleMedium: getTextStyle(AppColors.primaryColor, FontDimen.dimen16, fontWeight: FontWeight.w600),
          titleSmall: getTextStyle(AppColors.primaryColor, FontDimen.dimen14, fontWeight: FontWeight.w500)));
}

TextStyle getTextStyle(Color color, double size, {FontWeight? fontWeight}) =>
    TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        letterSpacing: 0.3,
        height: 1.2,
        fontFamily: 'regular');
