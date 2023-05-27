import 'package:ai_writing/screens/about_us_screen/about_us_screen.dart';
import 'package:ai_writing/screens/buy_history_screen/buy_history_controller.dart';
import 'package:ai_writing/screens/buy_history_screen/buy_history_screen.dart';
import 'package:ai_writing/screens/credit_history_screen/credit_history_screen.dart';
import 'package:ai_writing/screens/login_screen/login_screen.dart';
import 'package:ai_writing/utils/config_packages.dart';

class Appdrawer extends StatelessWidget {
  Appdrawer({super.key});

  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        padding: EdgeInsets.all(AppDimen.dimen20),
        decoration: AppDecoration.backroundDecoration,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: AppDimen.dimen20),
                      child: Row(
                        children: [
                          AppCommonWidgets.roundImg(radius: 20),
                          SizedBox(
                            width: AppDimen.dimen10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Arti Vaghani',
                                style: Get.theme.textTheme.headlineSmall,
                              ),
                              Text(
                                'Abc@gmail.com',
                                style: Get.theme.textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Get.theme.dividerColor,
                    ),
                    SizedBox(
                      height: AppDimen.dimen20,
                    ),
                    getListView(
                        AppString.creditHistory, Icons.history_edu_sharp,
                        onTap: () => Get.to(CreditHistoryScreen())),
                    getListView(AppString.buyHistory, Icons.history_rounded,
                        onTap: () => Get.to(BuyHistoryScreen())),
                    getListView(AppString.aboutUs, Icons.abc,
                        onTap: () => Get.to(AboutUsScreen())),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppDimen.dimen10),
                child: Text(
                  'Version : 1.0',
                  style: Get.theme.textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getListView(String title, IconData icon, {Function? onTap}) {
    return InkWell(
      onTap: () {
        Get.back();
        if (onTap != null) {
          onTap.call();
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppDimen.dimen10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon),
            SizedBox(
              width: AppDimen.dimen10,
            ),
            Text(
              title,
              style: Get.theme.textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
