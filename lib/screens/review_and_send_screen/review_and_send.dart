import 'package:ai_writing/common_widgets/btn_view.dart';
import 'package:ai_writing/utils/config_packages.dart';
import 'package:clipboard/clipboard.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ReviewAndSendScreen extends StatelessWidget {
  final String subject;
  final String email;
  final bool isFree;

  const ReviewAndSendScreen(
      {super.key,
      required this.subject,
      required this.email,
      this.isFree = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecoration.backroundDecoration(),
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
                    subject,
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
                        Share.share(email);
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
                        FlutterClipboard.copy(email).then((value) =>
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
                    email,
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
                      child: ButtonView(
                        color: Get.theme.cardColor,
                        title: AppString.reGenerate,
                        height: AppDimen.dimen70,
                        isBorder: true,
                        icon: AppCommonWidgets.roundAssetImg(AppImages.credit,
                            radius: 10),
                        subtitle: '1',
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
