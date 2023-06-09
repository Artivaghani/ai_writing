import 'dart:io';

import 'package:ai_writing/screens/home_screen/category_model.dart';
import 'package:ai_writing/screens/home_screen/credit_model.dart';
import 'package:ai_writing/utils/config_packages.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  bool isLoading = true;
  bool status = false;
  RxInt credit = 0.obs;
  RxString version = '1.0.0'.obs;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<CategoryData> categoryData = [];

  final newVersion = NewVersionPlus(
    iOSId: 'com.disney.disneyplus',
    androidId: 'com.avcodes.ai_writing',
  );

  @override
  void onInit() {
    status = StorageHelper().getTheme ?? Get.isDarkMode;
    super.onInit();
    initData();
  }

  initData() {
    AppFunctions.commonCheckInternetNavigate().then((value) {
      getCategory();
      if (StorageHelper().isLoggedIn) {
        getCredit();
      }

      checkVersion();
    });
  }

  getCategory() {
    isLoading = true;
    update();
    ApiManager.callGet(
      ApiUtils.baseUrl + ApiUtils.category,
      // headers: ApiParam.header,
    ).then((value) {
      CategoryModel data = CategoryModel.fromJson(value);
      categoryData = data.data ?? [];

      isLoading = false;
      update();
    }).onError((error, stackTrace) {
      isLoading = false;
      update();
      AppDialog.errorSnackBar(error.toString());
    });
  }

  getCredit() {
    ApiManager.callGet(
      ApiUtils.baseUrl + ApiUtils.credit,
      headers: ApiParam.header,
    ).then((value) {
      CreditModel data = CreditModel.fromJson(value);
      credit.value = data.data!.totalCredit ?? 0;
      print('credits :${credit.value}');
    }).onError((error, stackTrace) {
      print('error in credit :${error.toString()}');
      AppDialog.errorSnackBar(error.toString());
    });
  }

  void checkVersion() {
    ApiManager.callGet(
      '${ApiUtils.baseUrl}${ApiUtils.generalApi}?type=${ApiParam.appversion}',
    ).then((value) {
      print(' local v ${value['data']['play_store_version']}');

      newVersion.getVersionStatus().then((status) {
        version.value = status!.localVersion.toString();
        double localVersion =
            double.parse(status!.localVersion.toString().replaceAll('.', ''));
        double appStroreVersion = double.parse(
            value['data']['app_store_version'].toString().replaceAll('.', ''));
        double playStroreVersion = double.parse(
            value['data']['play_store_version'].toString().replaceAll('.', ''));
        if ((Platform.isAndroid && (localVersion >= playStroreVersion)) ||
            (Platform.isIOS && (localVersion >= appStroreVersion))) {
          AppDialog.showCommonDialog(
              title: AppString.updateavailable,
              subTitle: AppString.updateMsg,
              btnTitle2: AppString.update,
              calbback: () {
                if (Platform.isAndroid) {
                  launch(AppConst.playStoreLink);
                } else {
                  launch(AppConst.appStoreLink);
                }
              });
        }
      });
    }).onError((error, stackTrace) {});
  }
}
