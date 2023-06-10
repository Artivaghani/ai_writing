import 'package:ai_writing/screens/generate_screen.dart/generate_model.dart';
import 'package:ai_writing/utils/config_packages.dart';

class CorrectionController extends GetxController {
  TextEditingController keyPointController = TextEditingController();
  String correctionText = '';
  RxString lastText = ''.obs;
  RxDouble selectedLengh = 0.0.obs;

  callGenerateApi(String slug) {
    if (keyPointController.text.isEmpty) {
      AppDialog.errorSnackBar(AppString.keyPointRequired);
    } else {
      AppDialog.showProcess();
      ApiManager.callPost(
        ApiUtils.baseUrl + ApiUtils.generateApi,
        headers: ApiParam.header,
        body: {
          ApiParam.action: (lastText.value != keyPointController.text ||
                  correctionText.isEmpty)
              ? slug
              : ApiParam.reGenerate,
          ApiParam.prompt: keyPointController.text,
          ApiParam.length: AppConst.length[selectedLengh.value.toInt()]
        },
      ).then((value) {
        lastText.value = keyPointController.text;
        Get.back();
        GenerateModel data = GenerateModel.fromJson(value);
        correctionText = data.data!.choices?[0].text ?? '';
        update();
        Get.find<HomeController>().getCredit();
      }).onError((error, stackTrace) {
        Get.back();
        AppDialog.errorSnackBar(error.toString());
      });
    }
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
