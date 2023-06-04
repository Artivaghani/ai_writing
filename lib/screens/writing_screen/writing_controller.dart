import 'package:ai_writing/screens/writing_screen/template_model.dart';
import 'package:ai_writing/screens/writing_screen/your_model.dart';
import 'package:ai_writing/utils/config_packages.dart';

class WritingController extends GetxController {
  int selectTab = 0;
  bool isTempLoad = true;
  bool isLoad = true;
  List<TempData> tempList = [];
  List<YourDataList> yourList = [];

  getTempList(String? slug) {
    isTempLoad = true;
    update();
    ApiManager.callGet(
      '${ApiUtils.baseUrl}${ApiUtils.templateList}?type=$slug',
    ).then((value) {
      TemplateModel data = TemplateModel.fromJson(value);
      tempList = data.data ?? [];
      isTempLoad = false;
      update();
    }).onError((error, stackTrace) {
      isTempLoad = false;
      update();
    });
  }

  getYourList(String? slug) {
    isLoad = true;
    update();
    ApiManager.callGet('${ApiUtils.baseUrl}${ApiUtils.yourList}?type=$slug',
            headers: ApiParam.header)
        .then((value) {
      YourModel data = YourModel.fromJson(value);
      yourList = data.data ?? [];
      isLoad = false;
      update();
    }).onError((error, stackTrace) {
      isLoad = false;
      update();
    });
  }

  deleteListItem(String? id,String slug) {
    isLoad = false;
    update();
    ApiManager.callDelete('${ApiUtils.baseUrl}${ApiUtils.deleteItem}?id=$id',
            headers: ApiParam.header)
        .then((value) {
     getYourList(slug);
    }).onError((error, stackTrace) {
      isLoad = false;
      update();
    });
  }

  @override
  void onClose() {
    Get.delete<WritingController>();
    super.onClose();
  }
}
