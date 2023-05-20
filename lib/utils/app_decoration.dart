import 'config_packages.dart';

class AppDecoration {
  static BoxDecoration notiCountDecoration() {
    return BoxDecoration(color: Get.theme.primaryColor, shape: BoxShape.circle);
  }

  static BoxDecoration cardDecoration() {
    return BoxDecoration(
      color: AppColors.black.withOpacity(0.05),
      border: Border(
        bottom: BorderSide(color: Get.theme.primaryColor, width: 3.5),
        left: BorderSide(color: Get.theme.primaryColor, width: 1),
        top: BorderSide(color: Get.theme.primaryColor, width: 1),
        right: BorderSide(color: Get.theme.primaryColor, width: 3.5),
      ),
    );
  }
}
