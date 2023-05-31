import 'package:ai_writing/screens/home_screen/category_model.dart';
import 'package:ai_writing/utils/config_packages.dart';
import 'package:new_version_plus/new_version_plus.dart';

class HomeController extends GetxController {
  bool isLoading = true;
  bool status = false;
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
    });
  }

  versionCheckFun() {
    newVersion.getVersionStatus().then((status) {
      print(' local v ${status!.localVersion}');
    });
  }

  getCategory() {
    isLoading = true;
    update();
    ApiManager.callGet(
      ApiUtils.baseUrl + ApiUtils.category,
      headers: ApiParam.header,
    ).then((value) {
      CategoryModel data = CategoryModel.fromJson(value);
      categoryData = data.data ?? [];

      isLoading = false;
      update();
      versionCheckFun();
    }).onError((error, stackTrace) {
      isLoading = false;
      update();
      AppDialog.errorSnackBar(error.toString());
    });
  }
}
