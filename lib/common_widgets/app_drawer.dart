import 'package:ai_writing/screens/about_us_screen/about_us_controller.dart';
import 'package:ai_writing/screens/about_us_screen/about_us_screen.dart';
import 'package:ai_writing/screens/cred_history_screen/history_controller.dart';
import 'package:ai_writing/screens/cred_history_screen/history_screen.dart';
import 'package:ai_writing/screens/login_screen/login_screen.dart';
import 'package:ai_writing/utils/config_packages.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Appdrawer extends StatelessWidget {
  Appdrawer({super.key});
  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        padding: EdgeInsets.all(AppDimen.dimen20),
        decoration: AppDecoration.backroundDecoration(),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: AppDimen.dimen20),
                      child: Row(
                        children: [
                          Visibility(
                              visible: StorageHelper().isLoggedIn,
                              child: AppCommonWidgets.roundNetworkImg(
                                  StorageHelper().loginData.profile.toString(),
                                  radius: 20)),
                          SizedBox(
                            width: AppDimen.dimen10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                StorageHelper().isLoggedIn
                                    ? StorageHelper().loginData.name.toString()
                                    : AppString.guestUser,
                                style: Get.theme.textTheme.headlineSmall,
                              ),
                              Visibility(
                                visible: StorageHelper().isLoggedIn,
                                child: Text(
                                  StorageHelper().loginData.email.toString(),
                                  style: Get.theme.textTheme.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Get.theme.dividerColor,
                    ),
                    SizedBox(
                      height: AppDimen.dimen20,
                    ),
                    getListView(AppString.aboutUs, Icons.info_outline,
                        onTap: () {
                      Get.delete<AboutUsController>();
                      AdHelper.showInterStitialAd(afterAd: () {
                        Get.to(AboutUsScreen(
                          title: AppString.aboutUs,
                          slug: ApiParam.about,
                        ));
                      });
                    }),
                    getListView(AppString.creditHistory, Icons.history_rounded,
                        onTap: () {
                      AdHelper.showInterStitialAd(afterAd: () {
                        if (StorageHelper().isLoggedIn) {
                          Get.delete<HistoryController>();
                          Get.to(const HistoryScreen());
                        } else {
                          Get.to(LoginScreen());
                        }
                      });
                    }),
                    getListView(AppString.contactus, Icons.call, onTap: () {
                      AdHelper.showInterStitialAd(afterAd: () {
                        final Uri emailLaunchUri = Uri(
                          scheme: 'mailto',
                          path: 'info@codeinfluencer.com',
                        );
                        launchUrl(emailLaunchUri);
                      });
                    }),
                    getListView(
                        AppString.privacyPolicy, Icons.privacy_tip_rounded,
                        onTap: () {
                      AdHelper.showInterStitialAd(afterAd: () {
                        Get.delete<AboutUsController>();

                        Get.to(AboutUsScreen(
                          title: AppString.privacyPolicy,
                          slug: ApiParam.privacypolicy,
                        ));
                      });
                    }),
                    getListView(
                        AppString.termAndCon, Icons.description_outlined,
                        onTap: () {
                      AdHelper.showInterStitialAd(afterAd: () {
                        Get.delete<AboutUsController>();
                        Get.to(AboutUsScreen(
                          title: AppString.termAndCon,
                          slug: ApiParam.termconditions,
                        ));
                      });
                    }),
                    getListView(AppString.refundPolicy, Icons.repeat_rounded,
                        onTap: () {
                      AdHelper.showInterStitialAd(afterAd: () {
                        Get.delete<AboutUsController>();
                        Get.to(AboutUsScreen(
                          title: AppString.refundPolicy,
                          slug: ApiParam.refundpolicy,
                        ));
                      });
                    }),
                    getListView(AppString.shareThisApp, Icons.share, onTap: () {
                      AdHelper.showInterStitialAd(afterAd: () {
                        Share.share(
                            '${AppString.shareText} ${AppConst.playStoreLink}');
                      });
                    }),
                    getListView(AppString.rateThisApp, Icons.star, onTap: () {
                      AdHelper.showInterStitialAd(afterAd: () {
                        launch(AppConst.playStoreLink);
                      });
                    }),
                    Visibility(
                        visible: StorageHelper().isLoggedIn,
                        child: getListView(
                            AppString.logout, Icons.logout_rounded,
                            onTap: () => AppFunctions.logout())),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppDimen.dimen10),
                child: Text(
                  'Version : 1.0',
                  style: Get.theme.textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getListView(String title, IconData icon, {Function? onTap}) {
    return InkWell(
      onTap: () {
        Get.back();
        if (onTap != null) {
          onTap.call();
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppDimen.dimen12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon),
            SizedBox(
              width: AppDimen.dimen14,
            ),
            Text(
              title,
              style: Get.theme.textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
