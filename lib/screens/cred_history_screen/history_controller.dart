import 'package:ai_writing/screens/cred_history_screen/history_model.dart';

import '../../utils/config_packages.dart';

class HistoryController extends GetxController {
  bool isLoading = true;
  List<HistoryDataList> historyList = [];

  @override
  void onInit() {
    super.onInit();
    getCategory();
  }

  getCategory() {
    isLoading = true;
    update();

    ApiManager.callGet(
      ApiUtils.baseUrl + ApiUtils.creditHistory,
      headers: ApiParam.header,
    ).then((value) {
      CredHistoryModel data = CredHistoryModel.fromJson(value);
      historyList = data.data ?? [];

      isLoading = false;
      update();
    }).onError((error, stackTrace) {
      isLoading = false;
      update();
      AppDialog.errorSnackBar(error.toString());
    });
  }
}
