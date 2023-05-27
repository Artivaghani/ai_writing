import 'package:ai_writing/screens/correction_screen.dart/correction_screen.dart';
import 'package:ai_writing/screens/writing_screen/writing_screen.dart';
import 'package:ai_writing/utils/config_packages.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeController controller = Get.put(HomeController(),permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Appdrawer(),
        key: controller.scaffoldKey,
        body: Container(
          decoration: AppDecoration.backroundDecoration,
          padding: EdgeInsets.all(AppDimen.dimen22),
          height: AppDimen.screenHeight,
          child: SafeArea(
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () =>
                          controller.scaffoldKey.currentState!.openDrawer(),
                      child: AppCommonWidgets.roundShapBtn(
                          child: Icon(
                        Icons.menu_sharp,
                        size: AppDimen.dimen26,
                      )),
                    ),
                    InkWell(
                      onTap: () =>
                          controller.scaffoldKey.currentState!.openDrawer(),
                      child: AppCommonWidgets.roundImg(),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppDimen.dimen26),
                  child: Text(
                    '${AppString.hello},\nArti Vaghani',
                    style: Get.theme.textTheme.headlineLarge,
                  ),
                ),
                GetBuilder<HomeController>(
                  builder: (controller) => controller.isLoading
                      ? AppCommonWidgets.processIntegrator
                      : controller.getData == null ||
                              controller.getData!.list!.isEmpty
                          ? AppCommonWidgets.datanotfoundtext()
                          : GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      childAspectRatio: 1.1,
                                      crossAxisSpacing: AppDimen.dimen10,
                                      mainAxisSpacing: AppDimen.dimen10),
                              itemCount: controller.getData!.list!.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return InkWell(
                                    onTap: () {
                                      if (index == 0) {
                                        Get.to(WritingScreen());
                                      } else {
                                        Get.to(CorrectionScreen());
                                      }
                                    },
                                    child: const HomeCardWidget());
                              }),
                ),
              ],
            ),
          ),
        ));
  }
}
