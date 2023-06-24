import 'dart:io';

import 'package:ai_writing/utils/config_packages.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NativeAdController extends GetxController {
  bool isAdLoad = false;
  NativeAd? nativeAd;
  int loadCount = 0;
  bool isShort = true;

  @override
  void onInit() {
    super.onInit();
    getNativeAd();
  }

  getNativeAd() async {
    nativeAd = NativeAd(
      adUnitId:
          Platform.isAndroid ? AppConst.androidNativeId : AppConst.iosNativeId,
      factoryId: 'my_native',
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          isAdLoad = true;
          update();
        },
        onAdFailedToLoad: (ad, error) {
          loadCount++;
          if (loadCount <= 3) {
            getNativeAd();
          } else {
            loadCount = 0;
          }
          ad.dispose();
          isAdLoad = false;
          update();
        },
        onAdClicked: (ad) {},
        onAdImpression: (ad) {},
        onAdClosed: (ad) {},
        onAdOpened: (ad) {},
        onAdWillDismissScreen: (ad) {},
        onPaidEvent: (ad, valueMicros, precision, currencyCode) {},
      ),
      customOptions: {'isShort': isShort},
      request: const AdRequest(),
    );

    await nativeAd!.load();
  }
}
