import 'package:ai_writing/screens/about_us_screen/about_us_screen.dart';
import 'package:ai_writing/screens/buy_history_screen/buy_history_screen.dart';
import 'package:ai_writing/screens/credit_history_screen/credit_history_screen.dart';
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
                          AppCommonWidgets.roundNetworkImg(
                              StorageHelper().loginData.profile.toString(),
                              radius: 20),
                          SizedBox(
                            width: AppDimen.dimen10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                StorageHelper().loginData.name.toString(),
                                style: Get.theme.textTheme.headlineSmall,
                              ),
                              Text(
                                StorageHelper().loginData.email.toString(),
                                style: Get.theme.textTheme.bodySmall,
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
                        onTap: () => Get.to(AboutUsScreen())),
                    getListView(
                        AppString.creditHistory, Icons.history_edu_sharp,
                        onTap: () => Get.to(CreditHistoryScreen())),
                    getListView(AppString.buyHistory, Icons.history_rounded,
                        onTap: () => Get.to(BuyHistoryScreen())),
                    getListView(AppString.contactus, Icons.call, onTap: () {
                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: 'info@codeinfluencer.com',
                      );
                      launchUrl(emailLaunchUri);
                    }),
                    getListView(
                        AppString.privacyPolicy, Icons.privacy_tip_rounded,
                        onTap: () => Get.to(AboutUsScreen())),
                    getListView(
                        AppString.termAndCon, Icons.description_outlined,
                        onTap: () => Get.to(AboutUsScreen())),
                    getListView(AppString.refundPolicy, Icons.repeat_rounded,
                        onTap: () => Get.to(AboutUsScreen())),
                    getListView(AppString.shareThisApp, Icons.share, onTap: () {
                      Share.share(
                          '${AppString.shareText} ${AppConst.playStoreLink}');
                    }),
                    getListView(AppString.rateThisApp, Icons.star, onTap: () {
                      launch(AppConst.playStoreLink);
                    }),
                    getListView(AppString.logout, Icons.logout_rounded,
                        onTap: () => AppFunctions.logout()),
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
