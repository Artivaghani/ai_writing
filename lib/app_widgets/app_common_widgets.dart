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
            style: Get.theme.textTheme.subtitle1!
                .copyWith(color: AppColors.greyColor),
          ),
          Text(
            "No Data Found!",
            style: Get.theme.textTheme.subtitle1!
                .copyWith(color: AppColors.greyColor),
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
      AppDialog.errorSnackBar(AppString.checkConnection);
    }

    return false;
  }

  static commonCheckInternetNavigate({bool? isSplash}) async {
    bool value = await checkInternet(isShowMsg: false);
    if (value) {
      return true;
    }
    Get.offUntil(
        GetPageRoute(page: () => NetworkCheckScreen(isSplash: isSplash)),
        (route) => false);
    throw '';
  }

  static roundShapBtn({double? size, Widget? child}) {
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.primaryColor.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      width: size ?? AppDimen.dimen60,
      height: size ?? AppDimen.dimen60,
      child: Center(
        child: child ??
            Icon(
              Icons.arrow_back_ios_rounded,
              size: AppDimen.dimen20,
            ),
      ),
    );
  }

  static roundImg({double? radius}) {
    return CircleAvatar(
      radius: radius ?? 26,
      backgroundImage: NetworkImage('https://picsum.photos/id/237/200/300'),
    );
  }

  static networkImg(String url,
      {double? radius, double? width, double? height}) {
    return Container(
      width: width ?? AppDimen.dimen60,
      height: height ?? AppDimen.dimen60,
      decoration: BoxDecoration(
          color: Get.theme.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(radius ?? 0),
          image: DecorationImage(image: NetworkImage(url))),
    );
  }
}
