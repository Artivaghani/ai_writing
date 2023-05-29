import 'package:ai_writing/app_widgets/btn_view.dart';
import 'package:ai_writing/app_widgets/common_text_field.dart';
import 'package:ai_writing/helper/localization.dart';
import 'package:ai_writing/helper/localization_model.dart';
import 'package:ai_writing/screens/generate_screen.dart/generate_controller.dart';
import 'package:ai_writing/screens/review_and_send_screen/review_and_send.dart';
import 'package:ai_writing/utils/config_packages.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class GenerateScreen extends StatelessWidget {
  GenerateScreen({super.key});

  GenerateController controller = Get.put(GenerateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecoration.backroundDecoration,
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
                child: Text(AppString.keyPoint),
              ),
              CommonTextField(
                maxLines: 5,
                hintText: 'Write your thought here',
                maxLength: 250,
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
                        checkColor: Get.theme.hintColor,
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
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () => Get.to(const ReviewAndSendScreen()),
                  child: ButtonView(
                    title: AppString.generate,
                    height: AppDimen.dimen70,
                    width: AppDimen.dimen250,
                    icon:AppCommonWidgets.roundAssetImg(AppImages.credit,
                              radius: 10) ,
                    subtitle: '1',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.only(top: AppDimen.dimen20, bottom: AppDimen.dimen10),
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
          value: 1,
          interval: 2,
          activeColor: Get.theme.primaryColor,
          inactiveColor: Get.theme.hintColor,
          stepSize: 1,
          onChanged: (value) {},
        )
      ],
    );
  }
}
