import 'package:ai_writing/common_widgets/btn_view.dart';
import 'package:ai_writing/screens/generate_screen.dart/generate_screen.dart';
import 'package:ai_writing/screens/home_screen/category_model.dart';
import 'package:ai_writing/screens/login_screen/login_screen.dart';
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
      writingController.getYourList(categoryData.slug);
    });
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    print('token ${StorageHelper().loginData.authtoken}');
    return Scaffold(
      body: Container(
        decoration: AppDecoration.backroundDecoration(),
        padding: EdgeInsets.all(AppDimen.dimen16),
        width: double.infinity,
        child: SafeArea(
          child: DefaultTabController(
            length: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonAppBar(title: categoryData.title.toString()),
                Padding(
                  padding: EdgeInsets.only(
                      top: AppDimen.dimen20, bottom: AppDimen.dimen10),
                  child: Text(categoryData.description.toString()),
                ),
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
                                        itemBuilder: (context, index) =>
                                            InkWell(
                                                onTap: () =>
                                                    Get.to(ReviewAndSendScreen(
                                                      subject: writingController
                                                              .tempList[index]
                                                              .title ??
                                                          '',
                                                      email: writingController
                                                              .tempList[index]
                                                              .content ??
                                                          '',
                                                    )),
                                                child: EmailView(
                                                  title: writingController
                                                          .tempList[index]
                                                          .title ??
                                                      '',
                                                  image: ApiUtils.baseUrl +
                                                      (categoryData.image ??
                                                          ''),
                                                )),
                                      )
                            : writingController.isLoad
                                ? AppCommonWidgets.processIntegrator()
                                : writingController.yourList.isEmpty
                                    ? AppCommonWidgets.datanotfoundtext()
                                    : ListView.builder(
                                        itemCount:
                                            writingController.yourList.length,
                                        itemBuilder: (context, index) =>
                                            InkWell(
                                                onTap: () =>
                                                    Get.to(ReviewAndSendScreen(
                                                      subject: writingController
                                                              .yourList[index]
                                                              .prompt ??
                                                          '',
                                                      email: writingController
                                                              .yourList[index]
                                                              .result!
                                                              .choices?[0]
                                                              .text ??
                                                          '',
                                                    )),
                                                child: EmailView(
                                                  title: writingController
                                                          .yourList[index]
                                                          .tone ??
                                                      '',
                                                  subTitle: writingController
                                                          .yourList[index]
                                                          .prompt ??
                                                      '',
                                                  id: writingController
                                                          .yourList[index].id ??
                                                      0,
                                                  isFree: false,
                                                )),
                                      )))
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          if (StorageHelper().isLoggedIn) {
            Get.to(GenerateScreen(
              slug: categoryData.slug ?? '',
            ));
          } else {
            Get.to(LoginScreen());
          }
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
