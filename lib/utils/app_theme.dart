import 'config_packages.dart';

class AppTheme {
  static final dark = ThemeData.light().copyWith(
      backgroundColor: AppColors.black,
      primaryColor: AppColors.black,
      scaffoldBackgroundColor: AppColors.white,
      iconTheme: IconThemeData(color: AppColors.white),
      colorScheme: ColorScheme.dark(onPrimary: AppColors.primaryColor),
      cardColor: AppColors.black.withOpacity(0.5),
      // buttonTheme: const ButtonThemeData(
      //   buttonColor: AppColors.primaryColor,
      //   textTheme: ButtonTextTheme.primary,
      // ),
      // hintColor: AppColors.greyColor,
      textTheme: TextTheme(
          headlineLarge: getTextStyle(AppColors.black, FontDimen.dimen25, fontWeight: FontWeight.w700),
          headline1: getTextStyle(AppColors.white, FontDimen.dimen16, fontWeight: FontWeight.w800),
          bodyText1: getTextStyle(AppColors.black, FontDimen.dimen14),
          bodyText2: getTextStyle(AppColors.black, FontDimen.dimen12),
          caption: getTextStyle(AppColors.white, FontDimen.dimen16, fontWeight: FontWeight.w500)));

  static final light = ThemeData.dark().copyWith(
      primaryColor: AppColors.primaryColor,
      backgroundColor: AppColors.white,
      scaffoldBackgroundColor: AppColors.white,
      iconTheme: IconThemeData(color: AppColors.white),
      colorScheme: ColorScheme.light(onPrimary: AppColors.primaryColor),
      // unselectedWidgetColor: AppColors.primaryColor,
      // toggleableActiveColor: AppColors.primaryColor,
      // bottomAppBarColor: Colors.deepPurple,
      // buttonTheme: const ButtonThemeData(
      //   buttonColor: AppColors.primaryColor,
      //   textTheme: ButtonTextTheme.primary,
      // ),
      // hintColor: AppColors.greyColor,
      textTheme: TextTheme(
          headlineLarge: getTextStyle(AppColors.textColor, FontDimen.dimen25, fontWeight: FontWeight.w700),
          headline1: getTextStyle(AppColors.white, FontDimen.dimen16, fontWeight: FontWeight.w800),
          bodyText1: getTextStyle(AppColors.textColor, FontDimen.dimen14),
          bodyText2: getTextStyle(AppColors.textColor, FontDimen.dimen12),
          caption: getTextStyle(AppColors.primaryColor, FontDimen.dimen16, fontWeight: FontWeight.w500)));
}

TextStyle getTextStyle(Color color, double size, {FontWeight? fontWeight}) => TextStyle(color: color, fontSize: size, fontWeight: fontWeight, fontFamily: 'regular');
