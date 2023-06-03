import 'package:ai_writing/helper/localization.dart';
import 'package:ai_writing/helper/localization_model.dart';
import 'package:ai_writing/utils/config_packages.dart';

class GenerateController extends GetxController {
  RxInt selectTab = 0.obs;
  RxBool isChecked = false.obs;
  RxDouble selectedLengh = 1.0.obs;
  RxDouble selectedLevel = 1.0.obs;

  LanguageModel selectedLang = LocalizationHelper.langList[0];
  ToneModel selectedTone = AppConst.toneList[0];
  TextEditingController keyPointController = TextEditingController();

  @override
  void onInit() {
    update();
    super.onInit();
  }

  callGenerateApi(String slug) {
    if (keyPointController.text.isEmpty) {
      AppDialog.errorSnackBar(AppString.keyPointRequired);
    } else {
      AppDialog.showProcess();
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
        },
      ).then((value) {
        print('response ${value.toString()}');
        Get.back();
      }).onError((error, stackTrace) {
        Get.back();
        AppDialog.errorSnackBar(error.toString());
      });
    }
  }
}
