import 'package:ai_writing/screens/cred_history_screen/history_model.dart';
import 'package:ai_writing/utils/config_packages.dart';

class CreditView extends StatelessWidget {
  final HistoryDataList historyList;
  const CreditView({super.key, required this.historyList});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppConst.elevation,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: historyList.type.toString() == 'debit'
                ? AppColors.redColor
                : AppColors.greenColor,
            width: 1),
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
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        historyList.credit.toString(),
                        style: Get.theme.textTheme.headlineLarge,
                      ),
                      SizedBox(
                        width: AppDimen.dimen8,
                      ),
                      Image.asset(
                        AppImages.credit,
                        width: AppDimen.dimen26,
                        height: AppDimen.dimen26,
                      ),
                      SizedBox(
                        width: AppDimen.dimen8,
                      ),
                      historyList.type.toString() == 'debit'
                          ? Icon(
                              Icons.trending_up_rounded,
                              color: AppColors.redColor,
                              size: AppDimen.dimen26,
                            )
                          : Icon(
                              Icons.trending_down,
                              color: AppColors.greenColor,
                              size: AppDimen.dimen26,
                            )
                    ],
                  ),
                ),
                Text(
                  historyList.createdAt ?? '',
                  style: Get.theme.textTheme.bodySmall,
                ),
              ],
            ),
            SizedBox(
              height: AppDimen.dimen8,
            ),
            Text(
              historyList.description ?? '',
              style: Get.theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
