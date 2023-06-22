import 'dart:io';
import 'package:ai_writing/utils/config_packages.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  static const AdRequest request = AdRequest();
  static int isAdCount = 1;
  static int adsCount = 2;

  static listenToAppStateChanges() {
    AppStateEventNotifier.startListening();
    AppStateEventNotifier.appStateStream
        .forEach((state) => _onAppStateChanged(state));
  }

  static _onAppStateChanged(AppState appState) {
    if (appState == AppState.foreground) {
      loadOpenapp(callback: () {});
    }
  }

  static showRewardedAd({required Function calllBack}) {
    AppDialog.showProcess();
    RewardedAd.load(
        adUnitId: Platform.isAndroid
            ? AppConst.androidRevordeId
            : AppConst.iosRevordeId,
        request: request,
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd rewardedAd) {
            ServerSideVerificationOptions option =
                ServerSideVerificationOptions(
                    userId: StorageHelper().loginData.id.toString());
            rewardedAd.setServerSideOptions(option);

            Get.back();
            rewardedAd.fullScreenContentCallback = FullScreenContentCallback(
              onAdShowedFullScreenContent: (RewardedAd ad) {},
              onAdDismissedFullScreenContent: (RewardedAd ad) {
                ad.dispose();
              },
              onAdFailedToShowFullScreenContent:
                  (RewardedAd ad, AdError error) {
                ad.dispose();

                AppDialog.errorSnackBar(AppString.adsErrorMsg);
              },
            );

            rewardedAd.setImmersiveMode(true);
            rewardedAd.show(
                onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
              calllBack.call();
              ad.dispose();
            });
          },
          onAdFailedToLoad: (LoadAdError error) {
            Get.back();
            AppDialog.showCommonDialog(
                title: AppString.appname,
                subTitle: AppString.adsErrorMsg,
                btnTitle2: AppString.ok,
                calbback: () {});
          },
        ));
  }

  static Future<BannerAd?> getBannerAd() async {
    BannerAd myBanner = BannerAd(
      adUnitId:
          Platform.isAndroid ? AppConst.androidBannerId : AppConst.iosBannerId,
      request: const AdRequest(),
      listener: BannerAdListener(
          onAdLoaded: (Ad ad) {},
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            ad.dispose();
            return;
          }),
      size: AdSize.banner,
    );
    await myBanner.load();
    return myBanner;
  }

  static bannerWidget() {
    return Visibility(
      visible: AppConst.isAdShow,
      child: FutureBuilder(
        future: getBannerAd(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.done &&
                  snapshot.data != null)
              ? Stack(
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: snapshot.data!.size.height.toDouble(),
                      color: Colors.transparent,
                      child: AppCommonWidgets.processIntegrator(),
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: snapshot.data!.size.height.toDouble(),
                        width: double.infinity,
                        child: AdWidget(ad: snapshot.data!)),
                  ],
                )
              : const SizedBox();
        },
      ),
    );
  }

  static Future<void> loadOpenapp({required Function callback}) async {
    if (AppConst.isAdShow && !StorageHelper().isNewUser) {
      await AppOpenAd.load(
          adLoadCallback: AppOpenAdLoadCallback(onAdFailedToLoad: (error) {
            callback.call();
          }, onAdLoaded: (ad) async {
            await ad.show();
            ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {
                ad.dispose();
                callback.call();
              },
            );
          }),
          adUnitId:
              Platform.isAndroid ? AppConst.androidOpenId : AppConst.iosOpenId,
          request: const AdRequest(),
          orientation: AppOpenAd.orientationPortrait);
    } else {
      callback.call();
    }
  }

  static showInterStitialAd({required Function() afterAd}) {
    if (isAdCount % adsCount == 0 && AppConst.isAdShow) {
      AppDialog.showProcess();
      InterstitialAd.load(
        adUnitId: Platform.isAndroid
            ? AppConst.androidInterstrialId
            : AppConst.iosInterstrialId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (interstitialAd) {
            Get.back();
            interstitialAd.fullScreenContentCallback =
                FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {
                interstitialAd.dispose();
                isAdCount = 1;
              },
              onAdShowedFullScreenContent: (ad) {
                afterAd();
              },
            );
            interstitialAd.show();
          },
          onAdFailedToLoad: (err) {
            Get.back();
            afterAd();
          },
        ),
      );
    } else if (AppConst.isAdShow) {
      ++isAdCount;
      afterAd();
    } else {
      afterAd();
    }
  }
}
