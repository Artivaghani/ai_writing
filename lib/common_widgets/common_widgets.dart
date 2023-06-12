import 'package:ai_writing/utils/config_packages.dart';
import 'package:clipboard/clipboard.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class AppCommonWidgets {
  static Widget processIntegrator({Color? color}) => Center(
          child: SpinKitDoubleBounce(
        size: AppDimen.dimen50,
        color: color ?? Get.theme.primaryColor,
      ));

  static Widget datanotfoundtext({String? title}) {
    return Container(
      // height: AppDimen.screenHeight,
      width: AppDimen.screenWidth,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sorry!!!',
            style: Get.theme.textTheme.bodyLarge!
                .copyWith(color: AppColors.greyColor),
          ),
          Text(
            "Results not found",
            style: Get.theme.textTheme.bodyMedium!
                .copyWith(color: AppColors.greyColor),
          ),
        ],
      ),
    );
  }

  static shareView(String email) => InkWell(
        onTap: () {
          Share.share(email);
        },
        child: AppCommonWidgets.roundShapBtn(
            size: AppDimen.dimen40,
            child: Icon(
              Icons.share,
              size: AppDimen.dimen20,
            )),
      );

  static copyView(String email) => InkWell(
        onTap: () {
          FlutterClipboard.copy(email)
              .then((value) => AppDialog.successSnackBar(AppString.copy));
        },
        child: AppCommonWidgets.roundShapBtn(
            size: AppDimen.dimen40,
            child: Icon(
              Icons.copy_outlined,
              size: AppDimen.dimen20,
            )),
      );

  static roundShapBtn({double? size, Widget? child}) {
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.primaryColor.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      width: size ?? AppDimen.dimen60,
      height: size ?? AppDimen.dimen60,
      child: Center(
        child: child ??
            Icon(
              Icons.arrow_back_ios_rounded,
              size: AppDimen.dimen20,
            ),
      ),
    );
  }

  static roundNetworkImg(String url, {double? radius}) {
    return CircleAvatar(
      radius: radius ?? 26,
      backgroundImage: NetworkImage(url),
    );
  }

  static roundAssetImg(String path, {double? radius}) {
    return CircleAvatar(
      radius: radius ?? 26,
      backgroundImage: AssetImage(path),
    );
  }

  static networkImg(String url,
      {double? radius, double? width, double? height, Color? color}) {
    return Container(
      width: width ?? AppDimen.dimen60,
      height: height ?? AppDimen.dimen60,
      decoration: BoxDecoration(
          color: color ?? Get.theme.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(radius ?? 0),
          image: DecorationImage(image: NetworkImage(url))),
    );
  }

  static commonCard(Widget child, {BorderSide side = BorderSide.none}) {
    return Card(
      elevation: AppConst.elevation,
      shape: RoundedRectangleBorder(
        side: side,
        borderRadius: BorderRadius.circular(AppConst.cardRadius),
      ),
      child: child,
    );
  }

  static getLenthOfMail(double value, {Function(dynamic)? onChanged}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.only(top: AppDimen.dimen20, bottom: AppDimen.dimen10),
          child: Text(AppString.selectLength),
        ),
        Row(
          children: [
            Expanded(
              child: getText(AppConst.length[0]),
            ),
            Expanded(
                child:
                    getText(AppConst.length[1], textAlign: TextAlign.center)),
            Expanded(
                child: getText(AppConst.length[2], textAlign: TextAlign.end)),
          ],
        ),
        SfSlider(
          min: 0.0,
          max: 2,
          value: value,
          interval: 2,
          activeColor: Get.theme.primaryColor,
          inactiveColor: Get.theme.hintColor,
          stepSize: 1,
          onChanged: onChanged,
        )
      ],
    );
  }

  static getText(String title, {TextAlign? textAlign}) => Text(
        title,
        textAlign: textAlign ?? TextAlign.start,
        style: Get.theme.textTheme.headlineSmall,
      );
}
