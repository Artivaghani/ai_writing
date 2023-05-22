import 'package:ai_writing/utils/config_packages.dart';

class ButtonView extends StatelessWidget {
  final String? title;
  final Widget? icon;
  final String? subtitle;
  final double? height;
  final double? width;
  final Color? color;
  const ButtonView(
      {super.key,
      this.title,
      this.icon,
      this.subtitle,
      this.height,
      this.color,
      this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        elevation: AppConst.elevation,
        color:color?? Get.theme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConst.btnRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (title != null)
              Text(
                title!,
                style: Get.theme.textTheme.titleMedium,
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
                  style: Get.theme.textTheme.titleMedium,
                  maxLines: 2,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
