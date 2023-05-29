import 'package:ai_writing/app_widgets/btn_view.dart';
import 'package:ai_writing/app_widgets/common_text_field.dart';
import 'package:ai_writing/screens/correction_screen.dart/correction_controller.dart';
import 'package:ai_writing/utils/config_packages.dart';

class CorrectionScreen extends StatelessWidget {
  CorrectionScreen({super.key});

  CorrectionController controller = Get.put(CorrectionController());

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
                child: Text(AppString.keyPoint),
              ),
              CommonTextField(
                maxLines: 15,
                hintText: 'Write your thought here',
                maxLength: 250,
              ),
              AppCommonWidgets.getLenthOfMail(0),
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
                height: AppDimen.dimen20,
              ),
              Align(
                alignment: Alignment.center,
                child: ButtonView(
                  title: AppString.generate,
                  height: AppDimen.dimen70,
                  width: AppDimen.dimen250,
                   icon:AppCommonWidgets.roundAssetImg(AppImages.credit,
                              radius: 10),
                  subtitle: '1',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
