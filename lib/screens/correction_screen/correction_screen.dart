import 'package:ai_writing/common_dialogs/micro_view/micro_controller.dart';
import 'package:ai_writing/common_dialogs/micro_view/mictro_view.dart';
import 'package:ai_writing/common_widgets/btn_view.dart';
import 'package:ai_writing/common_widgets/common_text_field.dart';
import 'package:ai_writing/screens/correction_screen/correction_controller.dart';
import 'package:ai_writing/screens/home_screen/category_model.dart';
import 'package:ai_writing/screens/login_screen/login_screen.dart';
import 'package:ai_writing/utils/config_packages.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/services.dart';

class CorrectionScreen extends StatelessWidget {
  final CategoryData categoryData;

  CorrectionScreen({super.key, required this.categoryData});
  CorrectionController controller = Get.put(CorrectionController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.correctionText.isNotEmpty) {
          return controller.showExitDialog();
        }
        return Future.value(true);
      },
      child: Scaffold(
        body: Container(
          decoration: AppDecoration.backroundDecoration(),
          padding: EdgeInsets.all(AppDimen.dimen20),
          width: double.infinity,
          child: SafeArea(
            child: ListView(
              children: [
                CommonAppBar(
                  title: AppString.textRevision,
                  callBack: () {
                    if (controller.correctionText.isNotEmpty) {
                      controller.showExitDialog();
                    } else {
                      Get.back();
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: AppDimen.dimen20,
                      bottom: AppDimen.dimen10,
                      right: AppDimen.dimen10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppString.keyPoint),
                      InkWell(
                          onTap: () async {
                            String value = await FlutterClipboard.paste();
                            controller.setText(value);
                          },
                          child: Text(
                            AppString.paste,
                            style: Get.theme.textTheme.headlineSmall!
                                .copyWith(decoration: TextDecoration.underline),
                          )),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Obx(() {
                      return CommonTextField(
                        controller: controller.keyPointController,
                        maxLines: 15,
                        hintText: AppString.correctionHint,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(AppConst.lengthText[
                              controller.selectedLengh.value.toInt()]),
                        ],
                        maxLength: AppConst
                            .lengthText[controller.selectedLengh.value.toInt()],
                        style: Get.theme.textTheme.labelSmall,
                        onChanged: (p0) {
                          if (controller.lastText != p0) {
                            controller.update();
                          }
                        },
                      );
                    }),
                    Positioned(
                        bottom: 8,
                        left: 8,
                        child: InkWell(
                          onTap: () {
                            Get.delete<MicroController>();
                            showModalBottomSheet<void>(
                              context: context,
                              backgroundColor: Colors.transparent,
                              barrierColor: Colors.transparent,
                              builder: (BuildContext context) => MicroView(
                                onTap: (String text) {
                                  controller.setText(text);
                                },
                              ),
                            );
                          },
                          child: AppCommonWidgets.roundShapBtn(
                              size: AppDimen.dimen40,
                              child: Icon(Icons.mic, size: AppDimen.dimen26)),
                        )),
                  ],
                ),
                GetBuilder<CorrectionController>(
                  builder: (corectionController) {
                    return corectionController.correctionText.isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(
                                    top: AppDimen.dimen20,
                                    bottom: AppDimen.dimen10,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(AppString.reviewText),
                                      ),
                                      AppCommonWidgets.shareView(
                                          corectionController.correctionText),
                                      SizedBox(
                                        width: AppDimen.dimen8,
                                      ),
                                      AppCommonWidgets.copyView(
                                          corectionController.correctionText),
                                    ],
                                  )),
                              AppCommonWidgets.commonCard(Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(AppDimen.dimen20),
                                child: Text(
                                  corectionController.correctionText,
                                  style: Get.theme.textTheme.labelSmall,
                                ),
                              ))
                            ],
                          )
                        : const SizedBox();
                  },
                ),
                Obx(
                  () => AppCommonWidgets.getLenthOfMail(
                    controller.selectedLengh.value,
                    onChanged: (p0) {
                      controller.selectedLengh.value = p0;
                      controller.setText(controller.keyPointController.text);
                      controller.update();
                    },
                  ),
                ),
                SizedBox(
                  height: AppDimen.dimen20,
                ),
                GetBuilder<CorrectionController>(
                    builder: (controller) => InkWell(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            if (StorageHelper().isLoggedIn) {
                              controller.checkBalance(categoryData.slug ?? '');
                            } else {
                              Get.to(LoginScreen());
                            }
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: ButtonView(
                              title: (controller.lastText ==
                                          controller.keyPointController.text &&
                                      controller.correctionText.isNotEmpty)
                                  ? AppString.reRevise
                                  : AppString.revise,
                              height: AppDimen.dimen70,
                              width: AppDimen.dimen250,
                              icon: AppCommonWidgets.roundAssetImg(
                                  AppImages.credit,
                                  radius: 10),
                              subtitle:
                                  (controller.selectedLengh.value.toInt() + 1)
                                      .toString(),
                            ),
                          ),
                        ))
              ],
            ),
          ),
        ),
        bottomNavigationBar: AdHelper.bannerWidget(),
      ),
    );
  }
}
