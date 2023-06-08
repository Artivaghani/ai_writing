import 'package:ai_writing/screens/generate_screen.dart/generate_model.dart';
import 'package:ai_writing/utils/config_packages.dart';

class ReviewAndSendController extends GetxController {
  String subject = '';
  String email = '';

  callGenerateApi(String id) {
    AppDialog.showProcess();
    ApiManager.callPost(
      ApiUtils.baseUrl + ApiUtils.generateApi,
      headers: ApiParam.header,
      body: {
        ApiParam.action: ApiParam.reGenerate,
        ApiParam.id: id,
      },
    ).then((value) {
      Get.back();
      AdHelper.showInterStitialAd(afterAd: () {
        GenerateModel data = GenerateModel.fromJson(value);
        subject = data.data!.choices?[0].subject ?? '';
        email = data.data!.choices?[0].text ?? '';
        update();
      });
    }).onError((error, stackTrace) {
      Get.back();
      AppDialog.errorSnackBar(error.toString());
    });
  }
}
