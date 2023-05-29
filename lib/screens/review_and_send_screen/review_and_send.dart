import 'package:ai_writing/app_widgets/btn_view.dart';
import 'package:ai_writing/utils/config_packages.dart';
import 'package:clipboard/clipboard.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ReviewAndSendScreen extends StatelessWidget {
  const ReviewAndSendScreen({super.key});

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
              CommonAppBar(title: AppString.reviewAndSend),
              Padding(
                padding: EdgeInsets.only(
                    top: AppDimen.dimen20, bottom: AppDimen.dimen10),
                child: Text(AppString.subject),
              ),
              AppCommonWidgets.commonCard(InkWell(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppDimen.dimen16, vertical: AppDimen.dimen18),
                  child: Text(
                    'In general, AI systems work by ingesting large amounts of labeled training data',
                    style: Get.theme.textTheme.labelSmall,
                  ),
                ),
              )),
              Padding(
                padding: EdgeInsets.only(
                    top: AppDimen.dimen20, bottom: AppDimen.dimen10),
                child: Row(
                  children: [
                    Expanded(child: Text(AppString.email)),
                    InkWell(
                      onTap: () {
                        Share.share(
                            'check out my website ${AppConst.playStoreLink}');
                      },
                      child: AppCommonWidgets.roundShapBtn(
                          size: AppDimen.dimen40,
                          child: Icon(
                            Icons.share,
                            size: AppDimen.dimen20,
                          )),
                    ),
                    SizedBox(
                      width: AppDimen.dimen8,
                    ),
                    InkWell(
                      onTap: () {
                        FlutterClipboard.copy('hello flutter friends').then(
                            (value) =>
                                AppDialog.successSnackBar(AppString.copy));
                      },
                      child: AppCommonWidgets.roundShapBtn(
                          size: AppDimen.dimen40,
                          child: Icon(
                            Icons.copy_outlined,
                            size: AppDimen.dimen20,
                          )),
                    )
                  ],
                ),
              ),
              AppCommonWidgets.commonCard(InkWell(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppDimen.dimen16, vertical: AppDimen.dimen18),
                  child: Text(
                    'In general, AI systems work by ingesting large amounts of labeled training data, analyzing the data for correlations and patterns, and using these patterns to make predictions about future states. In this way, a chatbot that is fed examples of text can learn to generate lifelike exchanges with people, or an image recognition tool can learn to identify and describe objects in images by reviewing millions of examples. New, rapidly improving generative AI techniques can create realistic text, images, music and other media.AI programming focuses on cognitive skills that include the following:Learning. This aspect of AI programming focuses on acquiring data and creating rules for how to turn it into actionable information. The rules, which are called algorithms, provide computing devices with step-by-step instructions for how to complete a specific task.Reasoning. This aspect of AI programming focuses on choosing the right algorithm to reach a desired outcome.',
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
                    child: ButtonView(
                      color: Get.theme.cardColor,
                      title: AppString.reGenerate,
                      height: AppDimen.dimen70,
                      isBorder: true,
                      icon:AppCommonWidgets.roundAssetImg(AppImages.credit,
                              radius: 10) ,
                      subtitle: '1',
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () {
                        final Uri emailLaunchUri = Uri(
                          scheme: 'mailto',
                          query: encodeQueryParameters(<String, String>{
                            'body': 'Example Subject & Symbols are allowed!',
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
          ),
        ),
      ),
    );
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
