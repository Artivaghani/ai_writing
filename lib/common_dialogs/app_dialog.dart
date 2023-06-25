import 'package:ai_writing/common_widgets/btn_view.dart';
import 'package:ai_writing/common_widgets/native_ads_view/native_ads.dart';
import 'package:ai_writing/screens/subscription_screen/subscription_controller.dart';
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
      bool isAddShow = false,
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
                  // if (isAddShow)
                  //   NativeAdsView(
                  //     tag: 'popup',
                  //     hight: AppDimen.dimen250,
                  //     isShort: false,
                  //   ).paddingOnly(top: AppDimen.dimen10)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static creditDialog({required Function callBack}) {
    Get.find<HomeController>().getAdTime();
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
                            Get.delete<SubscriptionController>();
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
                    GetBuilder<HomeController>(
                      builder: (controller) => Column(
                        children: [
                          (AppConst.isAdShow &&
                                  StorageHelper().getAdDate.isEmpty)
                              ? InkWell(
                                  onTap: () {
                                    Get.back();
                                    AdHelper.showRewardedAd(
                                        calllBack: callBack);
                                  },
                                  child: ButtonView(
                                      title: AppString.watchAds,
                                      height: AppDimen.dimen80,
                                      icon: Icon(
                                        Icons.movie_filter,
                                        color: Get.theme.cardColor,
                                      ),
                                      color: Get.theme.primaryColor))
                              : RichText(
                                  text: TextSpan(
                                    text: AppString.adTimeMsg,
                                    style: Get.theme.textTheme.bodySmall,
                                    children: <TextSpan>[
                                      TextSpan(
                                          text:
                                              '${controller.differnt.inHours} : ${(controller.differnt.inMinutes % 60)} : ${(controller.differnt.inSeconds % 60)}',
                                          style: Get
                                              .theme.textTheme.headlineSmall!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                )
                        ],
                      ),
                    ),
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
