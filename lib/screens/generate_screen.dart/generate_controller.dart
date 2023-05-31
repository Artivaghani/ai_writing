import 'package:ai_writing/helper/localization.dart';
import 'package:ai_writing/helper/localization_model.dart';
import 'package:ai_writing/utils/config_packages.dart';

class GenerateController extends GetxController {
  RxInt selectTab = 0.obs;
  RxBool isChecked = false.obs;
  RxDouble selectedLengh = 1.0.obs;

  LanguageModel selectedLang = LocalizationHelper.langList[0];
  ToneModel selectedTone = AppConst.toneList[0];
  TextEditingController keyPointController=TextEditingController();

  @override
  void onInit() {
    update();
    super.onInit();
  }
}
