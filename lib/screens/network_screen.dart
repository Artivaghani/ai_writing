import 'package:ai_writing/common_widgets/btn_view.dart';

import '../utils/config_packages.dart';

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
            Center(
                child: Image.asset(AppImages.noInternet,
                    width: AppDimen.dimen300)),
            SizedBox(height: AppDimen.dimen18),
            Text(
              AppString.noInternet,
              style: Get.theme.textTheme.headlineMedium,
            ),
            SizedBox(height: AppDimen.dimen18),
            Text(AppString.checkConnection,
                style: Get.theme.textTheme.bodyMedium),
            SizedBox(height: AppDimen.dimen30),
            ButtonView(
              title: AppString.retry,
              height: AppDimen.dimen70,
              width: AppDimen.dimen250,
            )
          ],
        ),
      ),
    );
  }
}
