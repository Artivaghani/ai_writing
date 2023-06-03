import 'package:ai_writing/screens/about_us_screen/general_model.dart';
import 'package:ai_writing/utils/config_packages.dart';

class AboutUsController extends GetxController {
  bool isLoading = true;

  GeneralModel? apiData;

  callApi(String apiName) {
    ApiManager.callGet(
      '${ApiUtils.baseUrl}${ApiUtils.generalApi}?type=$apiName',
    ).then((value) {
      apiData = GeneralModel.fromJson(value);
      isLoading = false;
      update();
    }).onError((error, stackTrace) {
      isLoading = false;
      update();
      AppDialog.errorSnackBar(error.toString());
    });
  }

  @override
  void onClose() {
    Get.delete<AboutUsController>();
    super.onClose();
  }
}
