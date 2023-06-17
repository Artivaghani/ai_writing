import 'package:ai_writing/screens/generate_screen/generate_model.dart';
import 'package:ai_writing/screens/subscription_screen/subscription_screen.dart';
import 'package:ai_writing/utils/config_packages.dart';

class ReviewAndSendController extends GetxController {
  String subject = '';
  String email = '';
  HomeController homeController = Get.find<HomeController>();

  checkBalance(String id, int lengh) {
    if ((homeController.credit.value.toDouble() + 1) == lengh) {
      AppDialog.creditDialog(callBack: () {
        AppDialog.showProcess();
        Future.delayed(
          const Duration(seconds: 3),
          () {
            callGenerateApi(id, isAdShow: true);
          },
        );
      });
    } else if (homeController.credit.value.toDouble() < lengh) {
      AdHelper.showInterStitialAd(afterAd: () {
        Get.to(SubscriptionScreen());
      });
    } else {
      AppDialog.showProcess();
      callGenerateApi(id);
    }
  }

  callGenerateApi(String id, {bool isAdShow = false}) {
    ApiManager.callPost(
      ApiUtils.baseUrl + ApiUtils.generateApi,
      headers: ApiParam.header,
      body: {
        ApiParam.action: ApiParam.reGenerate,
        ApiParam.id: id,
        ApiParam.isAdsReward: isAdShow ? '1' : '0',
      },
    ).then((value) {
      Get.back();
      AdHelper.showInterStitialAd(afterAd: () {
        GenerateModel data = GenerateModel.fromJson(value);
        subject = data.data!.choices?[0].subject ?? '';
        email = data.data!.choices?[0].text ?? '';

        Get.find<HomeController>().getCredit();
        update();
      });
    }).onError((error, stackTrace) {
      Get.back();
      AppDialog.errorSnackBar(error.toString());
    });
  }
}
