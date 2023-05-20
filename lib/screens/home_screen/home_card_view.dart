import 'package:ai_writing/utils/config_packages.dart';

class HomeCardWidget extends StatelessWidget {
  HomeCardWidget({Key? key, required this.dataList, required this.index})
      : super(key: key);
  final ListElement dataList;
  int index;

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
          AppCommonWidgets.networkImg('https://picsum.photos/id/237/200/300',),
          SizedBox(
            height: AppDimen.dimen14,
          ),
          Text(
            'Email writing',
            style: Get.theme.textTheme.headlineMedium,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
