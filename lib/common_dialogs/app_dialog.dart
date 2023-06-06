import 'package:ai_writing/common_widgets/btn_view.dart';
import 'package:ai_writing/screens/subscription_screen/subscription_screen.dart';
import 'package:ai_writing/utils/config_packages.dart';

class AppDialog {
  static showProcess() {
    return Get.dialog(
      WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            content: Container(
                width: 30,
                height: 30,
                child: AppCommonWidgets.processIntegrator(
                    color: AppColors.secondaryColor)),
          )),
      barrierDismissible: false,
    );
  }

  static successSnackBar(String msg) {
    return ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
          backgroundColor: AppColors.greenColor,
          content: Text(
            msg,
            style: TextStyle(
                fontSize: FontDimen.dimen14, color: AppColors.secondaryColor),
          )),
    );
  }

  static errorSnackBar(String msg) {
    return ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
          backgroundColor: AppColors.redColor,
          content: Text(
            msg,
            style: TextStyle(
                fontSize: FontDimen.dimen14, color: AppColors.secondaryColor),
          )),
    );
  }

  static showCommonDialog(
      {required String? title,
      required String subTitle,
      String? btnTitle1,
      required String btnTitle2,
      required Function calbback}) {
    showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            return Future.value(false);
          },
          child: Dialog(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)), //this right here
            child: Container(
              decoration: AppDecoration.dialogBackroundDecoration(
                  borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.all(AppDimen.dimen20),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    title.toString(),
                    style: Get.theme.textTheme.headlineMedium,
                  ),
                  SizedBox(
                    height: AppDimen.dimen10,
                  ),
                  Text(
                    subTitle.toString(),
                  ),
                  SizedBox(
                    height: AppDimen.dimen30,
                  ),
                  btnTitle1 != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: ButtonView(
                                      title: btnTitle1,
                                      height: AppDimen.dimen60,
                                      isBorder: true,
                                      color:
                                          Get.theme.scaffoldBackgroundColor)),
                            ),
                            SizedBox(
                              width: AppDimen.dimen10,
                            ),
                            Expanded(
                              flex: 2,
                              child: InkWell(
                                  onTap: () {
                                    Get.back();
                                    calbback.call();
                                  },
                                  child: ButtonView(
                                      title: btnTitle2,
                                      height: AppDimen.dimen60,
                                      color: Get.theme.primaryColor)),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            const Expanded(flex: 1, child: Spacer()),
                            Expanded(
                              flex: 2,
                              child: InkWell(
                                  onTap: () {
                                    Get.back();
                                    calbback.call();
                                  },
                                  child: ButtonView(
                                      title: btnTitle2,
                                      height: AppDimen.dimen60,
                                      color: Get.theme.primaryColor)),
                            ),
                            const Expanded(flex: 1, child: Spacer()),
                          ],
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static creditDialog() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)), //this right here
          child: Container(
            decoration: AppDecoration.dialogBackroundDecoration(
                borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.all(AppDimen.dimen30),
            child: ListView(
              shrinkWrap: true,
              children: [
                Text(
                  AppString.creditDialogMsg,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: AppDimen.dimen20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                          AdHelper.showInterStitialAd(afterAd: () {
                            Get.to(SubscriptionScreen());
                          });
                        },
                        child: ButtonView(
                            title: AppString.byMoreCredit,
                            height: AppDimen.dimen80,
                            isBorder: true,
                            color: Get.theme.scaffoldBackgroundColor)),
                    SizedBox(
                      height: AppDimen.dimen10,
                    ),
                    InkWell(
                        onTap: () {
                          Get.back();
                          AdHelper.showInterStitialAd(afterAd: () {
                            AdHelper.showRewardedAd(calllBack: () {
                              Get.find<HomeController>().getCredit();
                            });
                          });
                        },
                        child: ButtonView(
                            title: AppString.watchAds,
                            height: AppDimen.dimen80,
                            color: Get.theme.primaryColor)),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
