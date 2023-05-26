import 'package:ai_writing/app_widgets/btn_view.dart';
import 'package:ai_writing/app_widgets/common_text_field.dart';
import 'package:ai_writing/helper/localization.dart';
import 'package:ai_writing/screens/generate_screen.dart/generate_controller.dart';
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
              getLangDropDown(),
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
              AppCommonWidgets.getLenthOfMail(1),
              getCriativityLevel(),
              Row(
                children: [
                  Obx(
                    () => SizedBox(
                      width: AppDimen.dimen26,
                      height: AppDimen.dimen26,
                      child: Checkbox(
                        checkColor: Get.theme.secondaryHeaderColor,
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
                child: ButtonView(
                  title: AppString.generate,
                  height: AppDimen.dimen60,
                  width: AppDimen.dimen200,
                  icon: Icon(
                    Icons.money,
                    size: AppDimen.dimen20,
                    color: Get.theme.cardColor,
                  ),
                  subtitle: '1',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  getLangDropDown() {
    return AppCommonWidgets.commonCard(Padding(
      padding: EdgeInsets.symmetric(
          vertical: AppDimen.dimen8, horizontal: AppDimen.dimen16),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          items: LocalizationHelper.emailGenLang
              .map((item) => DropdownMenuItem<Map>(
                    value: item,
                    child: Text(
                      item['name'],
                      style: Get.theme.textTheme.headlineMedium,
                    ),
                  ))
              .toList(),
          value: controller.selectedLang,
          onChanged: (value) {
            controller.selectedLang = value!;
          },
        ),
      ),
    ));
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
              child: AppCommonWidgets.getText(AppString.short),
            ),
            Expanded(
                child: AppCommonWidgets.getText(AppString.medium,
                    textAlign: TextAlign.center)),
            Expanded(
                child: AppCommonWidgets.getText(AppString.long,
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
          enableTooltip: true,
          minorTicksPerInterval: 1,
          onChanged: (value) {},
        )
      ],
    );
  }
}
