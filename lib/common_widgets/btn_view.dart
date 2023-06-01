import 'package:ai_writing/utils/config_packages.dart';

class ButtonView extends StatelessWidget {
  final String? title;
  final Widget? icon;
  final String? subtitle;
  final double? height;
  final double? width;
  final Color? color;
  final bool isBorder;
  const ButtonView(
      {super.key,
      this.title,
      this.icon,
      this.subtitle,
      this.height,
      this.color,
      this.isBorder = false,
      this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        elevation: AppConst.elevation,
        color: color ?? Get.theme.primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConst.btnRadius),
            side: isBorder
                ? BorderSide(color: Get.theme.primaryColor, width: 1)
                : BorderSide.none),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (title != null)
              Text(
                title!,
                style: isBorder
                    ? Get.theme.textTheme.headlineMedium
                    : Get.theme.textTheme.titleMedium,
                maxLines: 2,
              ),
            if (icon != null)
              Padding(
                padding: EdgeInsets.only(left: AppDimen.dimen14),
                child: icon,
              ),
            if (subtitle != null)
              Padding(
                padding: EdgeInsets.only(left: AppDimen.dimen14),
                child: Text(
                  subtitle!,
                  style: isBorder
                      ? Get.theme.textTheme.headlineMedium
                      : Get.theme.textTheme.titleMedium,
                  maxLines: 2,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
