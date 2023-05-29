import 'package:ai_writing/screens/login_screen/login_screen.dart';
import 'package:ai_writing/screens/network_screen.dart';
import 'package:ai_writing/utils/config_packages.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class AppFunctions {
  // static String timestampToDateTime(String timestamp) {
  //   var date = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp) * 1000);
  //   final f = DateFormat('dd MMM yyyy hh:mm a');
  //   return f.format(date).toString();
  // }

 static  logout() async {
    StorageHelper().removeUser();
    await Get.deleteAll();
    Get.offUntil(GetPageRoute(page: () => LoginScreen()), (route) => false);
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
  
}
