import 'package:ai_writing/screens/correction_screen.dart/correction_screen.dart';
import 'package:ai_writing/screens/writing_screen/writing_screen.dart';
import 'package:ai_writing/utils/config_packages.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeController controller = Get.put(HomeController(), permanent: true);

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
                        size: AppDimen.dimen22,
                      )),
                    ),
                    Row(
                      children: [
                        Text('20',style: Get.theme.textTheme.headlineLarge,),
                        SizedBox(width: AppDimen.dimen8,),
                        InkWell(
                          onTap: () =>
                              controller.scaffoldKey.currentState!.openDrawer(),
                          child: AppCommonWidgets.roundAssetImg(AppImages.credit,
                              radius: 16),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppDimen.dimen26),
                  child: Text(
                    '${AppString.hello},\n${StorageHelper().loginData.name}',
                    style: Get.theme.textTheme.headlineLarge,
                  ),
                ),
                GetBuilder<HomeController>(
                  builder: (controller) => controller.isLoading
                      ? Padding(
                          padding: EdgeInsets.only(top: AppDimen.dimen100),
                          child: AppCommonWidgets.processIntegrator(),
                        )
                      : controller.categoryData.isEmpty
                          ? Padding(
                              padding: EdgeInsets.only(top: AppDimen.dimen100),
                              child: AppCommonWidgets.datanotfoundtext(),
                            )
                          : GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      childAspectRatio: 1.1,
                                      crossAxisSpacing: AppDimen.dimen10,
                                      mainAxisSpacing: AppDimen.dimen10),
                              itemCount: controller.categoryData.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return InkWell(
                                    onTap: () {
                                      if (controller.categoryData[index].slug ==
                                              Slug.email ||
                                          controller.categoryData[index].slug ==
                                              Slug.proposal) {
                                        Get.to(WritingScreen(
                                            categoryData: controller
                                                .categoryData[index]));
                                      } else {
                                        Get.to(CorrectionScreen());
                                      }
                                    },
                                    child: HomeCardWidget(
                                        categoryData:
                                            controller.categoryData[index]));
                              }),
                ),
              ],
            ),
          ),
        ));
  }
}
