import 'package:ai_writing/screens/correction_screen.dart/correction_controller.dart';
import 'package:ai_writing/screens/correction_screen.dart/correction_screen.dart';
import 'package:ai_writing/screens/login_screen/login_screen.dart';
import 'package:ai_writing/screens/subscription_screen/subscription_screen.dart';
import 'package:ai_writing/screens/writing_screen/writing_controller.dart';
import 'package:ai_writing/screens/writing_screen/writing_screen.dart';
import 'package:ai_writing/utils/config_packages.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeController homeController = Get.put(HomeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AppDialog.showCommonDialog(
            title: AppString.exit,
            subTitle: AppString.exitMsg,
            btnTitle2: AppString.yes,
            btnTitle1: AppString.no,
            calbback: () {
              SystemNavigator.pop();
            });
        return Future.value(false);
      },
      child: Scaffold(
        drawer: Appdrawer(),
        key: homeController.scaffoldKey,
        body: Container(
          decoration: AppDecoration.backroundDecoration(),
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
                          homeController.scaffoldKey.currentState!.openDrawer(),
                      child: AppCommonWidgets.roundShapBtn(
                          child: Icon(
                        Icons.menu_sharp,
                        size: AppDimen.dimen22,
                      )),
                    ),
                    InkWell(
                      onTap: () {
                        AdHelper.showInterStitialAd(afterAd: () {
                          if (StorageHelper().isLoggedIn) {
                            Get.to(SubscriptionScreen());
                          } else {
                            Get.to(LoginScreen());
                          }
                        });
                      },
                      child: Row(
                        children: [
                          Obx(() => Text(
                                StorageHelper().isLoggedIn
                                    ? homeController.credit.value.toString()
                                    : '0',
                                style: Get.theme.textTheme.headlineLarge,
                              )),
                          SizedBox(
                            width: AppDimen.dimen8,
                          ),
                          AppCommonWidgets.roundAssetImg(AppImages.credit,
                              radius: 16),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppDimen.dimen26),
                  child: Text(
                    '${AppString.hello},\n${StorageHelper().isLoggedIn ? StorageHelper().loginData.name : AppString.guestUser}',
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
                                      AdHelper.showInterStitialAd(afterAd: () {
                                        if (controller
                                                    .categoryData[index].slug ==
                                                Slug.email ||
                                            controller
                                                    .categoryData[index].slug ==
                                                Slug.proposal) {
                                          Get.delete<WritingController>();
                                          Get.to(WritingScreen(
                                              categoryData: controller
                                                  .categoryData[index]));
                                        } else {
                                          if (StorageHelper().isLoggedIn) {
                                            Get.delete<CorrectionController>();
                                            Get.to(CorrectionScreen(
                                                categoryData: controller
                                                    .categoryData[index]));
                                          } else {
                                            Get.to(LoginScreen());
                                          }
                                        }
                                      });
                                    },
                                    child: HomeCardWidget(
                                        categoryData:
                                            controller.categoryData[index]));
                              }),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AdHelper.bannerWidget(),
      ),
    );
  }
}
