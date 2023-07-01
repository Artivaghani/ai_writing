import 'package:ai_writing/common_widgets/native_ads_view/native_ads.dart';
import 'package:ai_writing/screens/generate_screen/generate_controller.dart';
import 'package:ai_writing/screens/generate_screen/prompt_screen/promp_controller.dart';
import 'package:ai_writing/screens/generate_screen/prompt_screen/prompt_view.dart';
import 'package:ai_writing/utils/config_packages.dart';

class PromtScreen extends StatelessWidget {
  PromtScreen({super.key});

  PrompController prompController = Get.put(
    PrompController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecoration.backroundDecoration(),
        padding: EdgeInsets.all(AppDimen.dimen16),
        width: double.infinity,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonAppBar(title: AppString.selectPropmt),
              SizedBox(
                height: AppDimen.dimen10,
              ),
              GetBuilder<PrompController>(
                  builder: (controller) => SizedBox(
                        height: AppDimen.dimen60,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: prompController.categoryList.length,
                          itemBuilder: (context, index) =>
                              AppCommonWidgets.commonCard(
                                  Center(
                                      child: InkWell(
                                    onTap: () {
                                      controller.selectedTab = index;
                                      controller.searchPrompt();
                                    },
                                    child: Text(
                                      prompController
                                              .categoryList[index].name ??
                                          '',
                                      maxLines: 1,
                                      style: controller.selectedTab == index
                                          ? Get.theme.textTheme.titleSmall!
                                              .copyWith()
                                          : Get.theme.textTheme.bodySmall,
                                    ).paddingSymmetric(
                                        horizontal: AppDimen.dimen20,
                                        vertical: AppDimen.dimen10),
                                  )),
                                  color: controller.selectedTab == index
                                      ? Get.theme.primaryColor
                                      : null),
                        ),
                      )),
              Expanded(
                  child: GetBuilder<PrompController>(
                builder: (controller) => controller.isloading
                    ? AppCommonWidgets.processIntegrator()
                    : controller.promptList.isEmpty
                        ? AppCommonWidgets.datanotfoundtext()
                        : ListView.builder(
                            itemCount: controller.promptList.length,
                            itemBuilder: (context, index) => Column(
                              children: [
                                InkWell(
                                    onTap: () {
                                      Get.find<GenerateController>().keyPointController.text=controller.promptList[index].subTitle.toString();
                                      Get.back();
                                    },
                                    child: PromptView(
                                        promptList:
                                            controller.promptList[index])),
                                if ((index + 1) % AppConst.isShowCount == 0)
                                  NativeAdsView(
                                    tag: 'prompt$index',
                                  )
                              ],
                            ),
                          ),
              ))
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   FirebaseFirestore.instance.collection(FirebaseParam.prompts).add({
      //     'cat_id':'cwif01CRZvUDU6jU3Xir',
      //     'title': 'Request for information',
      //     'subTitle': 'Request for information',
      //   });
      // }),
    );
  }
}
