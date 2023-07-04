import 'package:ai_writing/helper/link_helper.dart';
import 'package:ai_writing/screens/about_us_screen/about_us_controller.dart';
import 'package:ai_writing/screens/about_us_screen/about_us_screen.dart';
import 'package:ai_writing/screens/cred_history_screen/history_controller.dart';
import 'package:ai_writing/screens/cred_history_screen/history_screen.dart';
import 'package:ai_writing/screens/login_screen/login_screen.dart';
import 'package:ai_writing/utils/config_packages.dart';
import 'package:flutter_switch/flutter_switch.dart';
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
                      final Uri emailLaunchUri = Uri(
                          scheme: 'mailto',
                          path: 'skycodeslab01@gmail.com',
                        );
                        launchUrl(emailLaunchUri);
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
                       Share.share(
                            '${AppString.shareText} ${AppConst.playStoreLink}');
                    }),
                    getListView(AppString.rateThisApp, Icons.star, onTap: () {
                       launch(AppConst.playStoreLink);
                    }),
                    Visibility(
                        visible: StorageHelper().isLoggedIn,
                        child: getListView(
                            AppString.logout, Icons.logout_rounded, onTap: () {
                          AppDialog.showCommonDialog(
                              title: AppString.logout,
                              subTitle: AppString.logoutMsg,
                              btnTitle1: AppString.no,
                              btnTitle2: AppString.yes,
                              calbback: () => AppFunctions.logout());
                        })),
                    SizedBox(
                      height: AppDimen.dimen20,
                    ),
                    if (StorageHelper().isLoggedIn)
                      InkWell(
                        onTap: () =>
                            DynamicLinkHandler().createDynamicLinkAndShare(),
                        child: AppCommonWidgets.commonCard(Row(
                          children: [
                            Image.asset(
                              AppImages.refer,
                              width: AppDimen.dimen100,
                              height: AppDimen.dimen100,
                            ),
                            SizedBox(
                              width: AppDimen.dimen10,
                            ),
                            Wrap(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppString.referafriend,
                                      style: Get.theme.textTheme.headlineSmall,
                                    ),
                                    SizedBox(
                                      height: AppDimen.dimen8,
                                    ),
                                    Text(
                                      AppString.referMsg,
                                      style: Get.theme.textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        )),
                      )
                  ],
                ),
              ),
              Obx(
                () => FlutterSwitch(
                  width: AppDimen.dimen100,
                  height: AppDimen.dimen50,
                  toggleSize: AppDimen.dimen45,
                  value: homeController.themeStatus.value,
                  borderRadius: AppDimen.dimen50,
                  padding: 2.0,
                  activeToggleColor: Get.theme.primaryColor,
                  inactiveToggleColor: Get.theme.cardColor,
                  activeSwitchBorder: Border.all(
                    color: Get.theme.primaryColor,
                    width: 1.0,
                  ),
                  inactiveSwitchBorder: Border.all(
                    color: Get.theme.primaryColor,
                    width: 1.0,
                  ),
                  activeColor: Get.theme.cardColor,
                  inactiveColor: Get.theme.primaryColor,
                  activeIcon: Icon(
                    Icons.nightlight_round,
                    color: Get.theme.cardColor,
                  ),
                  inactiveIcon: Icon(
                    Icons.wb_sunny,
                    color: Get.theme.primaryColor,
                  ),
                  onToggle: (val) async {
                    homeController.themeStatus.value = val;
                    StorageHelper().saveTheme = val;
                    if (val) {
                      Get.changeThemeMode(ThemeMode.dark);
                    } else {
                      Get.changeThemeMode(ThemeMode.light);
                    }

                    Future.delayed(
                      const Duration(milliseconds: 500),
                      () async {
                        await Get.deleteAll();
                        Get.offUntil(GetPageRoute(page: () => HomeScreen()),
                            (route) => false);
                      },
                    );
                  },
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
