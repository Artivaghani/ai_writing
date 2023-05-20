import '../utils/config_packages.dart';

// ignore: must_be_immutable
class NetworkCheckScreen extends StatelessWidget {
  bool? isSplash;

  NetworkCheckScreen({super.key, this.isSplash});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset(AppImages.noInternet, width: AppDimen.dimen300)),
            SizedBox(height: AppDimen.dimen18),
            Text(
              AppString.noInternet,
              style: Get.theme.textTheme.headline4,
            ),
            SizedBox(height: AppDimen.dimen18),
            Text(AppString.checkConnection, style: Get.theme.textTheme.headline6),
            SizedBox(height: AppDimen.dimen30),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
                child: Text(AppString.retry, style: Theme.of(context).textTheme.headline1),
                onPressed: () {
                  AppCommonWidgets.checkInternet(isShowMsg: false).then((value) {
                    if (value) {
                      if (isSplash ?? false) {
                        Get.offAll(SplashScreen());
                      } else {
                        Get.offUntil(GetPageRoute(page: () => HomeScreen()), (route) => false);
                        // Get.offAll(DashBoardScreen());
                      }
                    } else {
                      Get.back();
                    }
                  });
                })
          ],
        ),
      ),
    );
  }
}
