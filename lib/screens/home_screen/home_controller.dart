import 'dart:io';
import 'package:ai_writing/screens/home_screen/category_model.dart';
import 'package:ai_writing/screens/home_screen/credit_model.dart';
import 'package:ai_writing/utils/config_packages.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  bool isLoading = true;
  RxInt credit = 0.obs;
  String version = '1.0.0';
  RxBool themeStatus = true.obs;

  List<CategoryData> categoryData = [];

  final newVersion = NewVersionPlus(
    iOSId: 'com.disney.disneyplus',
    androidId: 'com.avcodes.ai_writing',
  );

  @override
  void onInit() {
    themeStatus.value = StorageHelper().getTheme ?? Get.isDarkMode;
    super.onInit();
    initData();
  }

  initData() {
    AppFunctions.commonCheckInternetNavigate().then((value) {
      getCategory();
      checkVersion();
      if (StorageHelper().isLoggedIn) {
        getCredit();
      }
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
      AdHelper.adsCount = data.data?.adsCount ?? 5;
    }).onError((error, stackTrace) {
      AppDialog.errorSnackBar(error.toString());
    });
  }

  void checkVersion() {
    ApiManager.callGet(
      '${ApiUtils.baseUrl}${ApiUtils.generalApi}?type=${ApiParam.appversion}',
    ).then((value) {
      if (!StorageHelper().isLoggedIn) {
        AdHelper.adsCount = value['data']['ads_count'] ?? 5;
      }

      AppConst.isAdShow = value['data']['is_ads'] == 1 ? true : false;
      update();

      newVersion.getVersionStatus().then((status) {
        version = status!.localVersion.toString();

        double localVersion =
            double.parse(status.localVersion.toString().replaceAll('.', ''));
        double appStroreVersion = double.parse(
            value['data']['app_store_version'].toString().replaceAll('.', ''));
        double playStroreVersion = double.parse(
            value['data']['play_store_version'].toString().replaceAll('.', ''));

        if ((Platform.isAndroid && (localVersion < playStroreVersion))) {
          showVersionDialog();
        } else if ((Platform.isIOS && (localVersion < appStroreVersion))) {
          showVersionDialog();
        }
      });
    }).onError((error, stackTrace) {});
  }

  showVersionDialog() {
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
}
