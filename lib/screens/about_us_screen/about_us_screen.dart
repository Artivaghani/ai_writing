import 'package:ai_writing/screens/about_us_screen/about_us_controller.dart';
import 'package:ai_writing/utils/config_packages.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class AboutUsScreen extends StatelessWidget {
  final String slug;
  final String title;

  AboutUsScreen({super.key, required this.slug, required this.title});

  AboutUsController aboutController = Get.put(AboutUsController());

  @override
  StatelessElement createElement() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      aboutController.callApi(slug);
    });

    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecoration.backroundDecoration(),
        padding: EdgeInsets.all(AppDimen.dimen20),
        width: double.infinity,
        child: SafeArea(
          child: Column(
            children: [
              CommonAppBar(title: title),
              Expanded(
                child: GetBuilder<AboutUsController>(
                    builder: (controller) => Padding(
                          padding: EdgeInsets.only(
                              top: AppDimen.dimen20, bottom: AppDimen.dimen10),
                          child: controller.isLoading
                              ? AppCommonWidgets.processIntegrator()
                              : controller.apiData == null
                                  ? AppCommonWidgets.datanotfoundtext()
                                  : ListView(
                                    children: [
                                      HtmlWidget(
                                          controller.apiData?.data?.content ?? '',
                                          textStyle:
                                              Get.theme.textTheme.headlineSmall,
                                        ),
                                    ],
                                  ),
                        )),
              ),
            ],
          ),
        ),
      ),
    bottomNavigationBar: AdHelper.bannerWidget(),
    );
  }
}
