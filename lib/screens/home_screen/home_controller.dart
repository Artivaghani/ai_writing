import 'package:ai_writing/utils/config_packages.dart';

class HomeController extends GetxController {
  bool isLoading = true;
  bool status = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Data? getData;

  @override
  void onInit() {
    status = StorageHelper().getTheme ?? Get.isDarkMode;
    super.onInit();
    initData();
  }

  initData() {
    AppCommonWidgets.commonCheckInternetNavigate().then((value) {
      callApi();
    });
  }

  callApi() {
    isLoading = true;
    update();
    ApiManager.callPost(
      ApiUtils.postsURL,
      body: {ApiParam.name: 'jinal', ApiParam.token: 'abc'},
    ).then((value) {
      getData = AllData.fromJson(value).data;

      isLoading = false;
      update();
    }).onError((error, stackTrace) {
      isLoading = false;
      update();
      AppDialog.errorSnackBar(error.toString());
    });
  }
}
