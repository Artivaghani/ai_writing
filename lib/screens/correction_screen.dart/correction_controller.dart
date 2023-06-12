import 'package:ai_writing/screens/generate_screen.dart/generate_model.dart';
import 'package:ai_writing/screens/subscription_screen/subscription_screen.dart';
import 'package:ai_writing/utils/config_packages.dart';

class CorrectionController extends GetxController {
  TextEditingController keyPointController = TextEditingController();
  String correctionText = '';
  String id = '';
  RxString lastText = ''.obs;
  RxDouble selectedLengh = 0.0.obs;
  HomeController homeController = Get.find<HomeController>();

  checkBalance(String slug) {
    if (keyPointController.text.isEmpty) {
      AppDialog.errorSnackBar(AppString.keyPointRequired);
    } else if ((homeController.credit.value.toDouble() + 1) ==
        (selectedLengh.value + 1)) {
      AppDialog.creditDialog(callBack: () {
        AppDialog.showProcess();
        Future.delayed(
          const Duration(seconds: 3),
          () {
            callGenerateApi(slug, isAdShow: true);
          },
        );
      });
    } else if (homeController.credit.value.toDouble() <
        (selectedLengh.value + 1)) {
      AdHelper.showInterStitialAd(afterAd: () {
        Get.to(SubscriptionScreen());
      });
    } else {
      AppDialog.showProcess();
      callGenerateApi(slug);
    }
  }

  callGenerateApi(String slug, {bool isAdShow = false}) {
    
    ApiManager.callPost(
      ApiUtils.baseUrl + ApiUtils.generateApi,
      headers: ApiParam.header,
      body: {
        ApiParam.action: (lastText.value == keyPointController.text &&
                correctionText.isNotEmpty)
            ? ApiParam.reGenerate
            : slug,
        ApiParam.id: id,
        ApiParam.prompt: keyPointController.text,
        ApiParam.length: AppConst.length[selectedLengh.value.toInt()],
        ApiParam.isAdsReward: isAdShow ? '1' : '0',
      },
    ).then((value) {
      lastText.value = keyPointController.text;
      Get.back();
      GenerateModel data = GenerateModel.fromJson(value);
      correctionText = data.data!.choices?[0].text ?? '';
      id = data.data!.id.toString();
      update();
      Get.find<HomeController>().getCredit();
    }).onError((error, stackTrace) {
      Get.back();
      AppDialog.errorSnackBar(error.toString());
    });
  }

  showExitDialog() {
    return AppDialog.showCommonDialog(
        title: AppString.exit,
        subTitle: AppString.screenExitMsg,
        btnTitle2: AppString.yes,
        btnTitle1: AppString.no,
        calbback: () {
          Get.back();
        });
  }

  setText(String text) {
    if (text.length > AppConst.lengthText[selectedLengh.value.toInt()]) {
      keyPointController.text =
          text.substring(0, AppConst.lengthText[selectedLengh.value.toInt()]);
    } else {
      keyPointController.text = text;
    }
  }
}
