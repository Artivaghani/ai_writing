import 'package:ai_writing/common_widgets/btn_view.dart';
import 'package:ai_writing/common_widgets/native_ads_view/native_ads.dart';
import 'package:ai_writing/screens/generate_screen/generate_controller.dart';
import 'package:ai_writing/screens/generate_screen/generate_screen.dart';
import 'package:ai_writing/screens/home_screen/category_model.dart';
import 'package:ai_writing/screens/review_and_send_screen/review_and_send.dart';
import 'package:ai_writing/screens/writing_screen/email_view.dart';
import 'package:ai_writing/screens/writing_screen/writing_controller.dart';
import 'package:ai_writing/utils/config_packages.dart';

class WritingScreen extends StatelessWidget {
  final CategoryData categoryData;
  WritingScreen({super.key, required this.categoryData});

  WritingController writingController = Get.put(WritingController());

  @override
  StatelessElement createElement() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      writingController.getTempList(categoryData.slug);
      if (StorageHelper().isLoggedIn) {
        writingController.getYourList(categoryData.slug);
      }
    });
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecoration.backroundDecoration(),
        padding: EdgeInsets.all(AppDimen.dimen16),
        width: double.infinity,
        child: SafeArea(
          child: DefaultTabController(
            length: StorageHelper().isLoggedIn ? 2 : 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonAppBar(title: categoryData.title.toString()),
                Padding(
                  padding: EdgeInsets.only(
                      top: AppDimen.dimen20, bottom: AppDimen.dimen15),
                  child: Text(categoryData.description.toString()),
                ),
                AdHelper.bannerWidget(),
                TabBar(
                  indicatorColor: Get.theme.primaryColor,
                  labelStyle: Get.theme.textTheme.headlineMedium,
                  unselectedLabelStyle: Get.theme.textTheme.bodyLarge,
                  labelColor: Get.theme.textTheme.headlineMedium!.color,
                  tabs: [
                    Tab(
                        icon: Text(categoryData.slug.toString() == Slug.email
                            ? AppString.freeEmail
                            : AppString.freeProposal)),
                    if (StorageHelper().isLoggedIn)
                      Tab(
                          icon: Text(categoryData.slug.toString() == Slug.email
                              ? AppString.yourEmails
                              : AppString.yourProposal)),
                  ],
                  onTap: (value) {
                    writingController.selectTab = value;
                    writingController.update();
                  },
                ),
                Expanded(
                    child: GetBuilder<WritingController>(
                        builder: (controller) => writingController.selectTab ==
                                0
                            ? writingController.isTempLoad
                                ? AppCommonWidgets.processIntegrator()
                                : writingController.tempList.isEmpty
                                    ? AppCommonWidgets.datanotfoundtext()
                                    : ListView.builder(
                                        itemCount:
                                            writingController.tempList.length,
                                        itemBuilder: (context, index) => Column(
                                          children: [
                                            InkWell(
                                                onTap: () =>
                                                    AdHelper.showInterStitialAd(
                                                        afterAd: () {
                                                      Get.to(
                                                          ReviewAndSendScreen(
                                                        subject:
                                                            writingController
                                                                    .tempList[
                                                                        index]
                                                                    .title
                                                                    ?.trim() ??
                                                                '',
                                                        email: writingController
                                                                .tempList[index]
                                                                .content
                                                                ?.trim() ??
                                                            '',
                                                      ));
                                                    }),
                                                child: EmailView(
                                                  title: writingController
                                                          .tempList[index].title
                                                          ?.trim() ??
                                                      '',
                                                  image: ApiUtils.baseUrl +
                                                      (categoryData.image ??
                                                          ''),
                                                )),
                                            if ((index+1) % AppConst.isShowCount ==
                                                0)
                                              NativeAdsView(
                                                tag: 'free$index',
                                              )
                                          ],
                                        ),
                                      )
                            : writingController.isLoad
                                ? AppCommonWidgets.processIntegrator()
                                : writingController.yourList.isEmpty
                                    ? AppCommonWidgets.datanotfoundtext()
                                    : ListView.builder(
                                        itemCount:
                                            writingController.yourList.length,
                                        itemBuilder: (context, index) => Column(
                                          children: [
                                            InkWell(
                                                onTap: () =>
                                                    AdHelper.showInterStitialAd(
                                                        afterAd: () {
                                                      Get.to(
                                                          ReviewAndSendScreen(
                                                        isFree: false,
                                                        id: writingController
                                                            .yourList[index]
                                                            .result
                                                            ?.id
                                                            .toString(),
                                                        length:
                                                            writingController
                                                                .yourList[index]
                                                                .length,
                                                        subject:
                                                            writingController
                                                                    .yourList[
                                                                        index]
                                                                    .result!
                                                                    .choices?[0]
                                                                    .subject
                                                                    ?.trim() ??
                                                                '',
                                                        email: writingController
                                                                .yourList[index]
                                                                .result!
                                                                .choices?[0]
                                                                .text
                                                                ?.trim() ??
                                                            '',
                                                      ));
                                                    }),
                                                child: EmailView(
                                                  title: writingController
                                                          .yourList[index]
                                                          .tone ??
                                                      '',
                                                  subTitle: writingController
                                                          .yourList[index]
                                                          .result!
                                                          .choices?[0]
                                                          .subject
                                                          ?.trim() ??
                                                      '',
                                                  id: writingController
                                                          .yourList[index].id ??
                                                      0,
                                                  isFree: false,
                                                  slug: categoryData.slug ?? '',
                                                )),
                                            if ((index+1) % AppConst.isShowCount ==
                                                0)
                                              NativeAdsView(
                                                tag: 'paid$index',
                                              )
                                          ],
                                        ),
                                      )))
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          AdHelper.showInterStitialAd(afterAd: () {
            Get.delete<GenerateController>();
            Get.to(GenerateScreen(
              slug: categoryData.slug ?? '',
            ));
          });
        },
        child: ButtonView(
          title: categoryData.slug.toString() == Slug.email
              ? AppString.aiemail
              : AppString.aiProposal,
          height: AppDimen.dimen70,
          width: categoryData.slug.toString() == Slug.email
              ? AppDimen.dimen180
              : AppDimen.dimen210,
          icon: Icon(
            Icons.edit,
            size: AppDimen.dimen20,
            color: Get.theme.cardColor,
          ),
        ),
      ),
    );
  }
}
