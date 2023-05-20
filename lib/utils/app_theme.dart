import 'config_packages.dart';

class AppTheme {
  static final light = ThemeData.light().copyWith(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.secondaryColor,
      iconTheme: const IconThemeData(color: AppColors.primaryColor),
      cardColor: AppColors.secondaryColor,
      hintColor: AppColors.terneryColor,
    dividerColor: AppColors.deviderColor ,
      textTheme: TextTheme(
        headlineLarge: getTextStyle(AppColors.primaryColor, FontDimen.dimen22,
            fontWeight: FontWeight.w600),
        headlineMedium: getTextStyle(AppColors.primaryColor, FontDimen.dimen16,
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
        labelMedium: getTextStyle(AppColors.primaryColor, FontDimen.dimen18,
            fontWeight: FontWeight.w500),
        labelSmall: getTextStyle(AppColors.primaryColor, FontDimen.dimen18,
            fontWeight: FontWeight.w400),
      ));
  static final dark = ThemeData.dark().copyWith(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.terneryColor,
      iconTheme: const IconThemeData(color: AppColors.primaryColor),
      cardColor: AppColors.secondaryColor.withOpacity(0.5),
      hintColor: AppColors.terneryColor,
       dividerColor: AppColors.deviderColor ,
      textTheme: TextTheme(
        headlineLarge: getTextStyle(AppColors.primaryColor, FontDimen.dimen22,
            fontWeight: FontWeight.w600),
        headlineMedium: getTextStyle(AppColors.primaryColor, FontDimen.dimen16,
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
        labelMedium: getTextStyle(AppColors.primaryColor, FontDimen.dimen18,
            fontWeight: FontWeight.w500),
        labelSmall: getTextStyle(AppColors.primaryColor, FontDimen.dimen18,
            fontWeight: FontWeight.w400),
      ));
}

TextStyle getTextStyle(Color color, double size, {FontWeight? fontWeight}) =>
    TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        fontFamily: 'regular');
