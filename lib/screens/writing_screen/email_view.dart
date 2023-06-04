import 'package:ai_writing/helper/localization_model.dart';
import 'package:ai_writing/screens/writing_screen/writing_controller.dart';
import 'package:ai_writing/utils/config_packages.dart';

class EmailView extends StatelessWidget {
  final int? id;
  final String title;
  final String? subTitle;
  final String? image;
  final bool isFree;
  final String? slug;

  const EmailView(
      {super.key,
      this.id,
      required this.title,
      this.subTitle,
      this.image,
      this.slug,
      this.isFree = true});

  @override
  Widget build(BuildContext context) {
    ToneModel? element;
    if (!isFree) {
      element = AppConst.toneList.firstWhere(
          (element) => element.name!.toLowerCase() == title.toLowerCase());
    }

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
                          element!.assetpath.toString(),
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
              )),
              Visibility(
                visible: !isFree,
                child: IconButton(
                    onPressed: () => Get.find<WritingController>()
                        .deleteListItem(id.toString(), slug.toString()),
                    icon: const Icon(
                      Icons.delete_forever_rounded,
                      color: AppColors.redColor,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
