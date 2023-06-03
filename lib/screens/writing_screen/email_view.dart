import 'package:ai_writing/utils/config_packages.dart';

class EmailView extends StatelessWidget {
  final int? id;
  final String title;
  final String? subTitle;
  final String? image;
  final bool isFree;

  const EmailView(
      {super.key,
      this.id,
      required this.title,
      this.subTitle,
      this.image,
      this.isFree = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppDimen.dimen8),
      child: Card(
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
                  child: isFree
                      ? Image.network(
                          image ?? '',
                          width: AppDimen.dimen30,
                          height: AppDimen.dimen30,
                        )
                      : Image.asset(
                          AppConst.toneList[0].assetpath.toString(),
                          width: AppDimen.dimen30,
                          height: AppDimen.dimen30,
                        )),
              SizedBox(
                width: AppDimen.dimen10,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Get.theme.textTheme.headlineMedium,
                  ),
                  Visibility(
                    visible: subTitle != null,
                    child: Padding(
                      padding: EdgeInsets.only(top: AppDimen.dimen6),
                      child: Text(
                        subTitle ?? '',
                        style: Get.theme.textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
