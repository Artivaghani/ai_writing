import 'package:ai_writing/screens/login_screen/login_screen.dart';
import '../../utils/config_packages.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  Future<double> whenNotZero(Stream<double> source) async {
    await for (double value in source) {
      if (value > 0) {
        return value;
      }
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: whenNotZero(
          Stream<double>.periodic(
              const Duration(milliseconds: 50), (x) => Get.height),
        ),
        builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data! > 0) {
              Future.delayed(
                const Duration(seconds: 3),
                () {
                  AdHelper.loadOpenapp(callback: () {
                    if (StorageHelper().isNewUser) {
                      Get.off(LoginScreen());
                    } else {
                      Get.offUntil(GetPageRoute(page: () => HomeScreen()),
                          (route) => false);
                    }
                  });
                },
              );
              return splashData();
            } else {
              return splashData();
            }
          } else {
            return splashData();
          }
        });
  }

  splashData() => Scaffold(
        body: Container(
          height: AppDimen.screenHeight,
          width: AppDimen.screenWidth,
          decoration: AppDecoration.backroundDecoration(),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(AppDimen.dimen80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.logo,
                  ),
                  SizedBox(height: AppDimen.dimen20),
                  Text(AppString.appname,
                      style: Get.theme.textTheme.headlineLarge),
                ],
              ),
            ),
          ),
        ),
      );
}
