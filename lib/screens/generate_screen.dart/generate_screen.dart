import 'package:ai_writing/app_widgets/btn_view.dart';
import 'package:ai_writing/app_widgets/common_text_field.dart';
import 'package:ai_writing/helper/localization.dart';
import 'package:ai_writing/screens/generate_screen.dart/generate_controller.dart';
import 'package:ai_writing/utils/config_packages.dart';

class GenerateScreen extends StatelessWidget {
  GenerateScreen({super.key});

  GenerateController controller = Get.put(GenerateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecoration.backroundDecoration,
        padding: EdgeInsets.all(AppDimen.dimen16),
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
              SizedBox(
                height: AppDimen.dimen20,
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
}
