import 'package:ai_writing/helper/localization.dart';
import 'package:ai_writing/helper/localization_model.dart';
import 'package:ai_writing/screens/generate_screen/generate_model.dart';
import 'package:ai_writing/screens/review_and_send_screen/review_and_send.dart';
import 'package:ai_writing/screens/subscription_screen/subscription_screen.dart';
import 'package:ai_writing/screens/writing_screen/writing_controller.dart';
import 'package:ai_writing/utils/config_packages.dart';

class GenerateController extends GetxController {
  RxInt selectTab = 0.obs;
  RxBool isChecked = false.obs;
  RxDouble selectedLengh = 1.0.obs;
  RxDouble selectedLevel = 1.0.obs;

  LanguageModel selectedLang = LocalizationHelper.langList[0];
  ToneModel selectedTone = AppConst.toneList[0];
  TextEditingController keyPointController = TextEditingController();
  HomeController homeController = Get.find<HomeController>();

  @override
  void onInit() {
    update();
    super.onInit();
  }

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
        ApiParam.action: slug,
        ApiParam.prompt: keyPointController.text,
        ApiParam.tone: selectedTone.name.toString(),
        ApiParam.length: AppConst.length[selectedLengh.value.toInt()],
        ApiParam.level: AppConst.level[selectedLevel.value.toInt()],
        ApiParam.lang: selectedLang.name.toString(),
        ApiParam.isemoji: isChecked.value ? '1' : '0',
        ApiParam.isAdsReward: isAdShow ? '1' : '0',
      },
    ).then((value) {
      Get.back();
      GenerateModel data = GenerateModel.fromJson(value);

      Get.find<WritingController>().selectTab = 1;
      Get.find<WritingController>().getYourList(slug);
      Get.find<HomeController>().getCredit();

      AdHelper.showInterStitialAd(afterAd: () {
        Get.off(ReviewAndSendScreen(
            isFree: false,
            id: data.data?.id ?? '',
            length: AppConst.length[selectedLengh.value.toInt()],
            subject: data.data!.choices?[0].subject?.trim() ?? '',
            email: data.data!.choices?[0].text?.trim() ?? ''));
      });
    }).onError((error, stackTrace) {
      Get.back();
      AppDialog.errorSnackBar(error.toString());
    });
  }
}
