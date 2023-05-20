import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ai_writing/utils/config_packages.dart';

import '../screens/network_screen.dart';

class AppCommonWidgets {
  static Widget get processIntegrator => Center(
          child: SpinKitThreeBounce(
        size: AppDimen.dimen30,
        color: AppColors.primaryColor,
      ));

  static datanotfoundtext({String? title}) {
    return Container(
      // height: AppDimen.screenHeight,
      width: AppDimen.screenWidth,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'oops!',
            style: Get.theme.textTheme.subtitle1!.copyWith(color: AppColors.greyColor),
          ),
          Text(
            "No Data Found!",
            style: Get.theme.textTheme.subtitle1!.copyWith(color: AppColors.greyColor),
          ),
        ],
      ),
    );
  }

  static Future<bool> checkInternet({bool isShowMsg = true}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else if (isShowMsg) {
      AppDialog.errorSnackBar(AppString.networkMsg);
    }

    return false;
  }

  static commonCheckInternetNavigate({bool? isSplash}) async {
    bool value = await checkInternet(isShowMsg: false);
    if (value) {
      return true;
    }
    Get.offUntil(GetPageRoute(page: () => NetworkCheckScreen(isSplash: isSplash)), (route) => false);
    throw '';
  }
}
