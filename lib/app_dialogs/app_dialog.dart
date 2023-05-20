import 'package:ai_writing/utils/config_packages.dart';

class AppDialog {
  static showProcess() {
    return Get.dialog(
      WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            content: Container(width: 30, height: 30, child: AppCommonWidgets.processIntegrator),
          )),
      barrierDismissible: false,
    );
  }

  static successSnackBar(String msg) {
    return ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
          backgroundColor: AppColors.primaryColor,
          content: Text(
            msg,
            style: TextStyle(fontSize: FontDimen.dimen14, color: AppColors.white),
          )),
    );
  }

  static errorSnackBar(String msg) {
    return ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
          backgroundColor: AppColors.redColor,
          content: Text(
            msg,
            style: TextStyle(fontSize: FontDimen.dimen14, color: AppColors.white),
          )),
    );
  }
}
