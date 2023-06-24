import 'package:ai_writing/common_widgets/btn_view.dart';
import 'package:ai_writing/screens/review_and_send_screen/review_and_send_controller.dart';
import 'package:ai_writing/utils/config_packages.dart';
import 'package:url_launcher/url_launcher.dart';

class ReviewAndSendScreen extends StatelessWidget {
  final String subject;
  final String email;
  final String? id;
  final String? length;
  final bool isFree;

  ReviewAndSendScreen(
      {super.key,
      required this.subject,
      required this.email,
      this.id,
      this.length,
      this.isFree = true});

  ReviewAndSendController reviewAndSendController =
      Get.put(ReviewAndSendController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecoration.backroundDecoration(),
        padding: EdgeInsets.all(AppDimen.dimen20),
        width: double.infinity,
        child: SafeArea(
          child: GetBuilder<ReviewAndSendController>(
              initState: (state) {
                reviewAndSendController.email = email;
                reviewAndSendController.subject = subject;
                if (!isFree) {
                  Future.delayed(
                    const Duration(seconds: 5),
                    () {
                      reviewAndSendController.checkReview();
                    },
                  );
                }
              },
              builder: (controller) => ListView(
                    children: [
                      CommonAppBar(title: AppString.reviewAndSend),
                      Padding(
                        padding: EdgeInsets.only(
                            top: AppDimen.dimen20, bottom: AppDimen.dimen10),
                        child: Text(AppString.subject),
                      ),
                      AppCommonWidgets.commonCard(InkWell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppDimen.dimen16,
                              vertical: AppDimen.dimen18),
                          child: Text(
                            reviewAndSendController.subject,
                            style: Get.theme.textTheme.labelSmall,
                          ),
                        ),
                      )),
                      Padding(
                        padding: EdgeInsets.only(
                            top: AppDimen.dimen20, bottom: AppDimen.dimen10),
                        child: Row(
                          children: [
                            Expanded(child: Text(AppString.content)),
                            AppCommonWidgets.shareView(email),
                            SizedBox(
                              width: AppDimen.dimen8,
                            ),
                            AppCommonWidgets.copyView(email),
                          ],
                        ),
                      ),
                      AppCommonWidgets.commonCard(InkWell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppDimen.dimen16,
                              vertical: AppDimen.dimen18),
                          child: Text(
                            reviewAndSendController.email,
                            style: Get.theme.textTheme.labelSmall,
                          ),
                        ),
                      )),
                      SizedBox(
                        height: AppDimen.dimen20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Visibility(
                              visible: !isFree,
                              child: InkWell(
                                onTap: () => controller.checkBalance(
                                    id ?? '',
                                    (AppConst.length.indexOf(length ?? '') +
                                        1)),
                                child: ButtonView(
                                  color: Get.theme.cardColor,
                                  title: AppString.reGenerate,
                                  height: AppDimen.dimen70,
                                  isBorder: true,
                                  icon: AppCommonWidgets.roundAssetImg(
                                      AppImages.credit,
                                      radius: 10),
                                  subtitle:
                                      (AppConst.length.indexOf(length ?? '') +
                                              1)
                                          .toString(),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: InkWell(
                              onTap: () {
                                final Uri emailLaunchUri = Uri(
                                  scheme: 'mailto',
                                  query: encodeQueryParameters(<String, String>{
                                    'subject': subject,
                                    'body': email,
                                  }),
                                );

                                launchUrl(emailLaunchUri);
                              },
                              child: ButtonView(
                                title: AppString.send,
                                height: AppDimen.dimen70,
                                icon: Icon(
                                  Icons.send_rounded,
                                  size: AppDimen.dimen20,
                                  color: Get.theme.cardColor,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
        ),
      ),
      bottomNavigationBar: AdHelper.bannerWidget(),
    );
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
