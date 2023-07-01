import 'package:ai_writing/common_widgets/native_ads_view/native_ads.dart';
import 'package:ai_writing/screens/generate_screen/prompt_screen/promp_controller.dart';
import 'package:ai_writing/screens/generate_screen/prompt_screen/prompt_view.dart';
import 'package:ai_writing/utils/config_packages.dart';

class PromtScreen extends StatelessWidget {
  const PromtScreen({super.key});

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
              Expanded(
                  child: GetBuilder<PrompController>(
                init: PrompController(),
                builder: (controller) => controller.isloading
                    ? AppCommonWidgets.processIntegrator()
                    : controller.promptList.isEmpty
                        ? AppCommonWidgets.datanotfoundtext()
                        : ListView.builder(
                          itemCount: controller.promptList.length,
                          itemBuilder: (context, index) => Column(
                            children: [
                              InkWell(
                                  onTap: () {},
                                  child: const PromptView()),
                              if ((index + 1) % AppConst.isShowCount ==
                                  0)
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
    );
  }
}
