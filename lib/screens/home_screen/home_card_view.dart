import 'package:ai_writing/screens/home_screen/category_model.dart';
import 'package:ai_writing/utils/config_packages.dart';

class HomeCardWidget extends StatelessWidget {
  final CategoryData categoryData;
  const HomeCardWidget({Key? key, required this.categoryData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppConst.elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConst.cardRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AppCommonWidgets.networkImg(
              '${ApiUtils.baseUrl}${categoryData.image}',
              color: Colors.transparent),
          SizedBox(
            height: AppDimen.dimen14,
          ),
          Text(
            categoryData.title.toString(),
            style: Get.theme.textTheme.headlineMedium,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
