import 'package:ai_writing/common_widgets/native_ads_view/native_ads_controller.dart';
import 'package:ai_writing/utils/config_packages.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NativeAdsView extends StatelessWidget {
  final String tag;
  final double? hight;
  final bool isShort;
  const NativeAdsView(
      {super.key, required this.tag, this.hight, this.isShort = true});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: AppConst.isAdShow,
      child: GetBuilder(
          init: NativeAdController()..isShort = isShort,
          tag: tag,
          builder: (controller) => controller.isAdLoad
              ? Container(
                  height: hight ?? AppDimen.dimen80,
                  alignment: Alignment.center,
                  width: AppDimen.screenWidth,
                  padding: EdgeInsets.only(
                    left: AppDimen.dimen8,
                    right: AppDimen.dimen8,
                    top: AppDimen.dimen8
                  ),
                  child: AdWidget(ad: controller.nativeAd!))
              : const SizedBox()),
    );
  }
}
