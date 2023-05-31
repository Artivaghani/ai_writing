import 'config_packages.dart';

class AppDecoration {
  static BoxDecoration notiCountDecoration() {
    return BoxDecoration(color: Get.theme.primaryColor, shape: BoxShape.circle);
  }

  static BoxDecoration cardDecoration() {
    return BoxDecoration(
      color: AppColors.primaryColor.withOpacity(0.05),
      border: Border(
        bottom: BorderSide(color: Get.theme.primaryColor, width: 3.5),
        left: BorderSide(color: Get.theme.primaryColor, width: 1),
        top: BorderSide(color: Get.theme.primaryColor, width: 1),
        right: BorderSide(color: Get.theme.primaryColor, width: 3.5),
      ),
    );
  }

  static backroundDecoration({BorderRadiusGeometry? borderRadius}) =>
      BoxDecoration(
        color: Get.theme.scaffoldBackgroundColor,
        borderRadius: borderRadius,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.5, 0.9],
          colors: [
            Get.theme.scaffoldBackgroundColor,
            Get.theme.hintColor.withOpacity(0.1),
          ],
        ),
      );

  static dialogBackroundDecoration({BorderRadiusGeometry? borderRadius}) =>
      BoxDecoration(
        color: Get.theme.scaffoldBackgroundColor,
        borderRadius: borderRadius,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.9, 1],
          colors: [
            Get.theme.scaffoldBackgroundColor,
            Get.theme.scaffoldBackgroundColor.withOpacity(0.1),
          ],
        ),
      );
}
