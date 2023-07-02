import 'package:ai_writing/common_dialogs/micro_view/micro_controller.dart';
import 'package:ai_writing/common_dialogs/micro_view/mictro_view.dart';
import 'package:ai_writing/common_widgets/btn_view.dart';
import 'package:ai_writing/common_widgets/common_text_field.dart';
import 'package:ai_writing/helper/localization.dart';
import 'package:ai_writing/helper/localization_model.dart';
import 'package:ai_writing/screens/generate_screen/generate_controller.dart';
import 'package:ai_writing/screens/generate_screen/prompt_screen/prompt_screen.dart';
import 'package:ai_writing/screens/login_screen/login_screen.dart';
import 'package:ai_writing/utils/config_packages.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class GenerateScreen extends StatelessWidget {
  final String slug;
  GenerateScreen({super.key, required this.slug});

  GenerateController controller = Get.put(GenerateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecoration.backroundDecoration(),
        padding: EdgeInsets.all(AppDimen.dimen20),
        width: double.infinity,
        child: SafeArea(
          child: ListView(
            children: [
              CommonAppBar(title: AppString.selectPurpose),
              Padding(
                padding: EdgeInsets.only(
                    top: AppDimen.dimen20, bottom: AppDimen.dimen10),
                child: Text(AppString.selectLang),
              ),
              getLangDropDown(),
              Padding(
                padding: EdgeInsets.only(
                    top: AppDimen.dimen20, bottom: AppDimen.dimen10),
                child: Text(AppString.selectTone),
              ),
              getToneList(),
              Padding(
                padding: EdgeInsets.only(
                    top: AppDimen.dimen20, bottom: AppDimen.dimen10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppString.keyPoint),
                    InkWell(
                        onTap: () => Get.to(PromtScreen(
                              slug: slug,
                            )),
                        child: Text(
                          AppString.selectPropmt,
                          style: Get.theme.textTheme.headlineSmall!
                              .copyWith(decoration: TextDecoration.underline),
                        )),
                  ],
                ),
              ),
              Stack(
                children: [
                  CommonTextField(
                    controller: controller.keyPointController,
                    maxLines: 6,
                    hintText: slug == Slug.email
                        ? AppString.keyPonitHint
                        : AppString.keyPonitHintProposal,
                    maxLength: 250,
                  ),
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
                                controller.keyPointController.text = text;
                                if (text.length > 250) {
                                  controller.keyPointController.text =
                                      text.substring(0, 250);
                                } else {
                                  controller.keyPointController.text = text;
                                }
                              },
                            ),
                          );
                        },
                        child: AppCommonWidgets.roundShapBtn(
                            size: AppDimen.dimen40,
                            child: Icon(Icons.mic, size: AppDimen.dimen26)),
                      ))
                ],
              ),
              Obx(
                () => AppCommonWidgets.getLenthOfMail(
                  controller.selectedLengh.value,
                  onChanged: (p0) {
                    controller.selectedLengh.value = p0;
                  },
                ),
              ),
              getCriativityLevel(),
              Row(
                children: [
                  Obx(
                    () => SizedBox(
                      width: AppDimen.dimen26,
                      height: AppDimen.dimen26,
                      child: Checkbox(
                        checkColor: Get.theme.cardColor,
                        focusColor: Get.theme.primaryColor,
                        activeColor: Get.theme.primaryColor,
                        value: controller.isChecked.value,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        onChanged: (bool? value) {
                          controller.isChecked.value = value!;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: AppDimen.dimen10,
                  ),
                  Expanded(
                      child: Text(
                    AppString.addEmoji,
                    style: Get.theme.textTheme.headlineSmall,
                  ))
                ],
              ),
              SizedBox(
                height: AppDimen.dimen30,
              ),
              Obx(() => Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        if (StorageHelper().isLoggedIn) {
                          controller.checkBalance(slug);
                        } else {
                          Get.to(LoginScreen());
                        }
                      },
                      child: ButtonView(
                        title: AppString.generate,
                        height: AppDimen.dimen70,
                        width: AppDimen.dimen250,
                        icon: AppCommonWidgets.roundAssetImg(AppImages.credit,
                            radius: 10),
                        subtitle: (controller.selectedLengh.value.toInt() + 1)
                            .toString(),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: AdHelper.bannerWidget(),
    );
  }

  getLangDropDown() {
    return GetBuilder<GenerateController>(
      builder: (controller) => AppCommonWidgets.commonCard(Padding(
        padding: EdgeInsets.symmetric(
            vertical: AppDimen.dimen8, horizontal: AppDimen.dimen16),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            dropdownColor: Get.theme.cardColor,
            iconEnabledColor: Get.theme.primaryColor,
            items: LocalizationHelper.langList
                .map((item) => DropdownMenuItem<LanguageModel>(
                      value: item,
                      child: Row(
                        children: [
                          Image.asset(
                            item.flagpath.toString(),
                            width: AppDimen.dimen30,
                            height: AppDimen.dimen20,
                          ),
                          SizedBox(
                            width: AppDimen.dimen8,
                          ),
                          Text(
                            item.name.toString(),
                            style: Get.theme.textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ))
                .toList(),
            value: controller.selectedLang,
            onChanged: (value) {
              controller.selectedLang = value!;
              controller.update();
            },
          ),
        ),
      )),
    );
  }

  getToneList() {
    return GetBuilder<GenerateController>(
      builder: (controller) => AppCommonWidgets.commonCard(Padding(
        padding: EdgeInsets.symmetric(
            vertical: AppDimen.dimen8, horizontal: AppDimen.dimen16),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            dropdownColor: Get.theme.cardColor,
            iconEnabledColor: Get.theme.primaryColor,
            items: AppConst.toneList
                .map((item) => DropdownMenuItem<ToneModel>(
                      value: item,
                      child: Row(
                        children: [
                          AppCommonWidgets.roundShapBtn(
                            size: AppDimen.dimen50,
                            child: Image.asset(
                              item.assetpath.toString(),
                              width: AppDimen.dimen30,
                              height: AppDimen.dimen30,
                            ),
                          ),
                          SizedBox(
                            width: AppDimen.dimen8,
                          ),
                          Text(
                            item.name.toString(),
                            style: Get.theme.textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ))
                .toList(),
            value: controller.selectedTone,
            onChanged: (value) {
              controller.selectedTone = value!;
              controller.update();
            },
          ),
        ),
      )),
    );
  }

  getCriativityLevel() {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: AppDimen.dimen20, bottom: AppDimen.dimen10),
            child: Text(AppString.creativityLevel),
          ),
          Row(
            children: [
              Expanded(
                child: AppCommonWidgets.getText(AppConst.level[0]),
              ),
              Expanded(
                  child: AppCommonWidgets.getText(AppConst.level[1],
                      textAlign: TextAlign.center)),
              Expanded(
                  child: AppCommonWidgets.getText(AppConst.level[2],
                      textAlign: TextAlign.end)),
            ],
          ),
          SfSlider(
            min: 0.0,
            max: 2,
            value: controller.selectedLevel.value,
            interval: 2,
            activeColor: Get.theme.primaryColor,
            inactiveColor: Get.theme.hintColor,
            stepSize: 1,
            onChanged: (value) {
              controller.selectedLevel.value = value;
            },
          )
        ],
      );
    });
  }
}
