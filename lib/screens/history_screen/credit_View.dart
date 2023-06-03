import 'package:ai_writing/utils/config_packages.dart';

class CreditView extends StatelessWidget {
  const CreditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppConst.elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConst.cardRadius),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppDimen.dimen20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'title',
                  style: Get.theme.textTheme.headlineMedium,
                ),
                Text(
                  '20-30-2022',
                  style: Get.theme.textTheme.bodySmall,
                ),
              ],
            ),
            SizedBox(
              height: AppDimen.dimen6,
            ),
            Text(
              'title',
              style: Get.theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
