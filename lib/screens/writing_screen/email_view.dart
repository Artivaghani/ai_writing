import 'package:ai_writing/utils/config_packages.dart';

class EmailView extends StatelessWidget {
  const EmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppConst.elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConst.cardRadius),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppDimen.dimen20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppCommonWidgets.roundShapBtn(
                size: AppDimen.dimen50,
                child: AppCommonWidgets.roundImg(radius: 10)),
                 SizedBox(
                  width: AppDimen.dimen10,
                ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'title',
                  style: Get.theme.textTheme.headlineMedium,
                ),
                SizedBox(
                  height: AppDimen.dimen6,
                ),
                Text(
                  'title',
                  style: Get.theme.textTheme.bodyMedium,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
