import 'package:ai_writing/app_widgets/btn_view.dart';
import 'package:ai_writing/screens/login_screen/login_controller.dart';
import 'package:ai_writing/utils/config_packages.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: AppDecoration.backroundDecoration,
      padding: EdgeInsets.all(AppDimen.dimen16),
      width: double.infinity,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: AppDimen.dimen60,
            ),
            Image.asset(
              AppImages.logo,
              width: AppDimen.dimen200,
              height: AppDimen.dimen200,
            ),
            SizedBox(
              height: AppDimen.dimen10,
            ),
            Text(
              '${AppString.welcome} ${AppString.appname}',
              style: Get.theme.textTheme.headlineLarge,
            ),
            SizedBox(
              height: AppDimen.dimen50,
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 8,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(AppDimen.dimen20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: AppDimen.dimen20,
                        ),
                        Text(
                          AppString.login,
                          style: Get.theme.textTheme.headlineLarge,
                        ),
                        SizedBox(
                          height: AppDimen.dimen14,
                        ),
                        Text(
                          'AI is indeed moving from the research lab into business, industrial, and professional applications',
                          style: Get.theme.textTheme.bodySmall,
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: AppDimen.dimen30,
                        ),
                        ButtonView(
                          title: AppString.loginWidGoogle,
                          height: AppDimen.dimen70,
                          icon: Image.asset(
                            AppImages.google,
                            width: AppDimen.dimen26,
                            height: AppDimen.dimen26,
                            color: Get.theme.cardColor,
                          ),
                        ),
                        SizedBox(
                          height: AppDimen.dimen30,
                        ),
                        RichText(
                          text: TextSpan(
                            text: AppString.loginWarning,
                            style: Get.theme.textTheme.bodySmall,
                            children: <TextSpan>[
                              TextSpan(
                                text: ' ${AppString.termAndCon}',
                                style: Get.theme.textTheme.bodySmall!.copyWith(
                                    color: Get.theme.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: ' ${AppString.loginWarning1}',
                                style: Get.theme.textTheme.bodySmall!,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
