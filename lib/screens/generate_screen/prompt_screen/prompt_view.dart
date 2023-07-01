import 'package:ai_writing/utils/config_packages.dart';

class PromptView extends StatelessWidget {
  const PromptView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppDimen.dimen8),
      child: Card(
        elevation: AppConst.elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConst.cardRadius),
        ),
        
        child: Container(
          padding: EdgeInsets.all(AppDimen.dimen20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Company-wide Update',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Get.theme.textTheme.headlineSmall,
              ),
              Padding(
                padding: EdgeInsets.only(top: AppDimen.dimen6),
                child: Text(
                  'New Employee Benefits Package',
                  maxLines: 2,
                  style: Get.theme.textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
