// import 'dart:io';

// import 'package:aismarttonemail/utils/config_packages.dart';

// class AdHelper {
//   static const AdRequest request = AdRequest();
//   static int isAdCount = 1;

//   static showRewardedAd({required Function calllBack}) {
//     AppDialog.showProcess();
//     RewardedAd.load(
//         adUnitId: Platform.isAndroid ? AppConst.androidRewardedAdID : AppConst.iosRewardedAdID,
//         request: request,
//         rewardedAdLoadCallback: RewardedAdLoadCallback(
//           onAdLoaded: (RewardedAd rewardedAd) {
//             print('UID ${StorageHelper().loginData.uid.toString()}');
//             ServerSideVerificationOptions option = ServerSideVerificationOptions(userId: StorageHelper().loginData.uid.toString());
//             rewardedAd.setServerSideOptions(option);

//             Get.back();
//             rewardedAd.fullScreenContentCallback = FullScreenContentCallback(
//               onAdShowedFullScreenContent: (RewardedAd ad) => debugPrint('ad onAdShowedFullScreenContent.'),
//               onAdDismissedFullScreenContent: (RewardedAd ad) {
//                 debugPrint('$ad onAdDismissedFullScreenContent.');
//                 ad.dispose();
//               },
//               onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
//                 debugPrint('$ad onAdFailedToShowFullScreenContent: $error');
//                 ad.dispose();

//                 AppDialog.errorSnackBar(AppString.adsErrorMsg);
//               },
//             );

//             rewardedAd.setImmersiveMode(true);
//             rewardedAd.show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
//               calllBack.call();
//               debugPrint('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
//               ad.dispose();
//             });
//           },
//           onAdFailedToLoad: (LoadAdError error) {
//             debugPrint('RewardedAd failed to load: $error');
//             Get.back();
//             AppDialog.errorSnackBar(AppString.adsErrorMsg);
//           },
//         ));
//   }

//   static Future<BannerAd?> getBannerAd() async {
//     BannerAd myBanner = BannerAd(
//       adUnitId: Platform.isAndroid ? AppConst.androidBannerAdID : AppConst.iosBannerAdID,
//       request: const AdRequest(),
//       listener: BannerAdListener(
//           onAdLoaded: (Ad ad) {},
//           onAdFailedToLoad: (Ad ad, LoadAdError error) {
//             ad.dispose();
//             return;
//           }),
//       size: AdSize.banner,
//     );
//     await myBanner.load();
//     return myBanner;
//   }

//   static bannerWidget({bool? backgroundshow}) {
//     return Visibility(
//       visible: AppConst.isAdShow,
//       child: FutureBuilder(
//         future: getBannerAd(),
//         builder: (context, snapshot) {
//           return (snapshot.connectionState == ConnectionState.done && snapshot.data != null)
//               ? Stack(
//                   children: [
//                     Container(
//                       height: snapshot.data!.size.height.toDouble(),
//                       color: Get.theme.scaffoldBackgroundColor,
//                       child: Shimmer.fromColors(
//                           baseColor: Get.theme.colorScheme.onPrimary.withOpacity(0.5),
//                           highlightColor: Get.theme.colorScheme.tertiary.withOpacity(0.5),
//                           child: Container(
//                               padding: const EdgeInsets.all(8),
//                               height: snapshot.data!.size.height.toDouble(),
//                               width: backgroundshow ?? false ? snapshot.data!.size.width.toDouble() : double.infinity,
//                               child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                                 Container(width: snapshot.data!.size.width.toDouble(), height: AppDimen.dimen12, color: Colors.grey),
//                                 Container(width: snapshot.data!.size.width.toDouble(), height: AppDimen.dimen12, color: Colors.grey)
//                               ]))),
//                     ),
//                     Container(
//                         alignment: Alignment.center,
//                         height: snapshot.data!.size.height.toDouble(),
//                         width: backgroundshow ?? false ? snapshot.data!.size.width.toDouble() : double.infinity,
//                         child: AdWidget(ad: snapshot.data!)),
//                   ],
//                 )
//               : const SizedBox();
//         },
//       ),
//     );
//   }

//   static Future<void> loadOpenapp({required Function callback}) async {
//     if (AppConst.isAdShow) {
//       await AppOpenAd.load(
//           adLoadCallback: AppOpenAdLoadCallback(onAdFailedToLoad: (error) {
//             callback.call();
//           }, onAdLoaded: (ad) async {
//             await ad.show();
//             ad.fullScreenContentCallback = FullScreenContentCallback(
//               onAdDismissedFullScreenContent: (ad) {
//                 ad.dispose();
//                 callback.call();
//               },
//             );
//           }),
//           adUnitId: Platform.isAndroid ? AppConst.androidAppOpenAdID : AppConst.iosAppOpenAdID,
//           request: const AdRequest(),
//           orientation: AppOpenAd.orientationPortrait);
//     } else {
//       callback.call();
//     }
//   }

//   static showInterStitialAd({required Function() afterAd}) {
//     if (isAdCount % 5 == 0) {
//       AppDialog.showProcess();
//       InterstitialAd.load(
//         adUnitId: Platform.isAndroid ? AppConst.androidInterStitialAdID : AppConst.iosInterStitialAdID,
//         request: const AdRequest(),
//         adLoadCallback: InterstitialAdLoadCallback(
//           onAdLoaded: (interstitialAd) {
//             Get.back();
//             interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
//               onAdDismissedFullScreenContent: (ad) {
//                 interstitialAd.dispose();
//                 isAdCount = 1;
//               },
//               onAdShowedFullScreenContent: (ad) {
//                 afterAd();
//               },
//             );
//             interstitialAd.show();
//           },
//           onAdFailedToLoad: (err) {
//             Get.back();
//             afterAd();
//           },
//         ),
//       );
//     } else {
//       ++isAdCount;
//       print('isAdCount: $isAdCount');
//       afterAd();
//     }
//   }
// }
