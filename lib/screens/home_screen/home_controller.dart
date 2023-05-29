import 'package:ai_writing/screens/home_screen/category_model.dart';
import 'package:ai_writing/utils/config_packages.dart';

class HomeController extends GetxController {
  bool isLoading = true;
  bool status = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<CategoryData> categoryData = [];

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
    }).onError((error, stackTrace) {
      isLoading = false;
      update();
      AppDialog.errorSnackBar(error.toString());
    });
  }
}
