import 'package:ai_writing/utils/config_packages.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({Key? key, })
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
