import 'package:ai_writing/utils/config_packages.dart';

class CommonAppBar extends StatelessWidget {
  final String title;
  final Function()? callBack;
  const CommonAppBar({super.key, required this.title, this.callBack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimen.dimen14),
      child: Row(
        children: [
          InkWell(
            onTap: callBack ?? () =>  Get.back(),
            child: AppCommonWidgets.roundShapBtn(
              size: AppDimen.dimen50,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimen.dimen20),
              child: Text(
                title,
                style: Get.theme.textTheme.labelLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
