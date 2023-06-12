import 'package:ai_writing/helper/subscription_helper.dart';
import 'package:get/get.dart';

class SubscriptionController extends GetxController {
  int selectTab = 0;
  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
    SubScriptionHandler.initStoreInfo(callBack: () {
      isLoading = false;
      update();
    });
  }
}
